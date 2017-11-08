//
//  ViewController.m
//  24
//
//  Created by kami on 2017/11/2.
//  Copyright © 2017年 kami. All rights reserved.
//

#import "ViewController.h"
#import "FormulaStringCalcUtility.h"
#import "FMDB.h"
#define DBNAME  @"personinfo.sqlite"
#define NAME    @"name"
#define SCORE   @"score"
#define TIME    @"time"
#define TABLENAME   @"PERSONINFO"
#import "newview.h"
#import<QuartzCore/QuartzCore.h>

@interface ViewController ()<ChangeName>


@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@end

@implementation ViewController




-(void)changeName:(NSString *)string
{
    self.NameLabel.text=string;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NextViewController* vc=segue.destinationViewController;
    vc.delegate=self;
    
    __weak __typeof(self) weakSelf = self;
    vc.change=^(NSString* stringName){
    weakSelf.NameLabel.text=stringName;
    };
}//页面跳转

-(IBAction)buttonph{
    lableone.alpha=1.0;
    labletwo.alpha=1.0;
    lablethree.alpha=1.0;
}//点击排行榜显示排名


-(IBAction)buttonsave{
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, score INTEGER, time INTEGER)";
    
    [self execSql:sqlCreateTable];
    NSString *sql1 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%d', '%d')",
                      TABLENAME, NAME, SCORE, TIME,_NameLabel.text,score, lable18];
    
    [self execSql:sql1];//插入新输入的用户信息
    NSString *sqlQuery = @"SELECT * FROM PERSONINFO ORDER BY score DESC";
    sqlite3_stmt * statement;
    NSMutableArray *dataArr = [[NSMutableArray alloc]init];
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name = (char*)sqlite3_column_text(statement, 1);
            NSString *nsNameStr = [[NSString alloc]initWithUTF8String:name];
            int scoree = sqlite3_column_int(statement, 2);
            int time = sqlite3_column_int(statement, 3);
            NSString *stuData = [NSString stringWithFormat:@"name:%@  score:%d  time:%d",nsNameStr,scoree, time];
            [dataArr addObject:stuData];
        }
    }
    sqlite3_close(db);
    lableone.text = [dataArr objectAtIndex: 0];
    labletwo.text = [dataArr objectAtIndex: 1];
    lablethree.text = [dataArr objectAtIndex: 2];
    
}//保存插入并重新排序

-(IBAction)buttonre{
    score = 0;
    lable18 =0;
    count = 0;
    second = 0;
    [self setGame];
}//全部重置

-(IBAction)buttonjisuan{
    
    NSString *myString= _showText.text;
    NSInteger leny=myString.length;
    int numStartPoint = 0;
    for (int i = 0; i < leny; i++){
        char c = [myString characterAtIndex:i];
        if (c == '+' || c == '-'||c=='*'||c=='('||c==')'||c=='/') {
         int b = [[myString substringWithRange:NSMakeRange(numStartPoint, i - numStartPoint)]intValue];
        numStartPoint=i+1;
        }
        else{
            int b = [[myString substringWithRange:NSMakeRange(numStartPoint, leny - numStartPoint)]intValue];//分割字符串判断输入的字符是否为显示的随机数
            NSLog(@"%d",b);
         if(b!=lable11&&b!=lable12&&b!=lable13&&b!=lable14){
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请只用显示的随机数来完成"
         message:[NSString stringWithFormat:@"Score:%d",score] preferredStyle:UIAlertControllerStyleAlert];
         scoreLabel.text = [NSString stringWithFormat:@"Score:%d",score];
         UIAlertAction *againAction = [UIAlertAction actionWithTitle:@"start"
         style:UIAlertActionStyleCancel
         handler:nil];
         [alert addAction:againAction];
         [self presentViewController:alert animated:YES completion:nil];
         [self setGame];
                                                                                            //显示错误界面
         }
        }
    }
    
             
             NSString *result = [FormulaStringCalcUtility calcComplexFormulaString:myString];//计算字符串的值
             if([result isEqualToString:@"24.00"])
             {
                 score+=1;
                 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"success"
                                                                                message:[NSString stringWithFormat:@"Score:%d",score] preferredStyle:UIAlertControllerStyleAlert];
                 
                 scoreLabel.text = [NSString stringWithFormat:@"Score:%d",score];
                 
                 UIAlertAction *goonAction = [UIAlertAction actionWithTitle:@"go on"
                                                                      style:UIAlertActionStyleCancel
                                                                    handler:nil];
                 [alert addAction:goonAction];
                 [self presentViewController:alert animated:YES completion:nil];
                 [self setGame];                           //显示成功界面
             }
             else{
                 [timer invalidate];
                 
                 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"wrong"
                                                                                message:[NSString stringWithFormat:@"Score:%d",score] preferredStyle:UIAlertControllerStyleAlert];
                 
                 scoreLabel.text = [NSString stringWithFormat:@"Score:%d",score];
                 
                 UIAlertAction *againAction = [UIAlertAction actionWithTitle:@"Again"
                                                                       style:UIAlertActionStyleCancel
                                                                     handler:nil];
                 [alert addAction:againAction];
                 [self presentViewController:alert animated:YES completion:nil];
                 [self setGame];
                 //显示错误界面
             }
             
             if([result isEqualToString:@"NO"]){
                 [self check24point];//穷举法验算
                 if(bol==1){
                     score+=1;
                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"success"
                                                                                    message:[NSString stringWithFormat:@"Score:%d",score] preferredStyle:UIAlertControllerStyleAlert];
                     
                     scoreLabel.text = [NSString stringWithFormat:@"Score:%d",score];
                     
                     UIAlertAction *goonAction = [UIAlertAction actionWithTitle:@"go on"
                                                                          style:UIAlertActionStyleCancel
                                                                        handler:nil];
                     [alert addAction:goonAction];
                     [self presentViewController:alert animated:YES completion:nil];
                     [self setGame];
                     
                 }
             }
             else{
                 [timer invalidate];
                 
                 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"wrong"
                                                                                message:[NSString stringWithFormat:@"Score:%d",score] preferredStyle:UIAlertControllerStyleAlert];
                 
                 scoreLabel.text = [NSString stringWithFormat:@"Score:%d",score];
                 
                 UIAlertAction *againAction = [UIAlertAction actionWithTitle:@"Again"
                                                                       style:UIAlertActionStyleCancel
                                                                     handler:nil];
                 [alert addAction:againAction];
                 [self presentViewController:alert animated:YES completion:nil];
                 [self setGame];
                 
             }
    

    
}
- (bool) check24point{
    NSString *str_sign[4] = {@"+", @"-", @"*", @"/"};
    int initArray[4] = {lable11, lable12, lable13, lable14};
    for (int i=0; i<4; i++){
        for (int j=0; j<4; j++){
            if (j==i){
                continue;
            }
            for (int m=0; m<4; m++){
                if (m==j||m==i){
                    continue;
                }
                for (int n=0; n<4; n++){
                    if (n==i||n==m||n==j){
                        continue;
                    }
                    float result1[4];
                    [self initCheck24PointDetails:initArray[i] p2:initArray[j] array:result1];
                    for (int res1=0; res1<4; res1++){
                        float result2[4];
                        if (result1[res1]<0){
                            continue;
                        }
                        [self initCheck24PointDetails:result1[res1] p2:initArray[m] array:result2];
                        for (int res2=0; res2<4; res2++){
                            float result3[4];
                            if (result2[res2]<0){
                                continue;
                            }
                            [self initCheck24PointDetails:result2[res2] p2:initArray[n] array:result3];
                            
                            for (int res3=0; res3<4; res3++){
                                if (result3[res3]>23.99999&&result3[res3]<24.00001){
                                    NSLog(@"((%d%@%d)%@%d)%@%d = %f", initArray, str_sign[res1], initArray[j], str_sign[res2], initArray[m], str_sign[res3], initArray[n], result3[res3]);
                                    bol=1;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return bol;
}
- (void) initCheck24PointDetails:(float)p1  p2:(float)p2 array:(float*)array{
    array[0] = p1+p2;
    array[1] = p1-p2;
    array[2] = p1*p2;
    array[3] = p1/p2;
}


-(IBAction)buttonPressed
{
    count=1;
    if(count!=0){
        lable11 = 3;//(arc4random()%13)+1;
        lable12 = 3;//(arc4random()%13)+1;
        lable13 = 6;//(arc4random()%13)+1;
        lable14 = 2;//(arc4random()%13)+1;
        NSArray *imgArray=[[NSArray alloc] initWithObjects:@"0.png",@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",nil];
        int i1=lable11;
        int i2=lable12;
        int i3=lable13;
        int i4=lable14;
        [_imgview1 setImage:[UIImage imageNamed:[imgArray objectAtIndex:i1]]];
        
        [_imgview2 setImage:[UIImage imageNamed:[imgArray objectAtIndex:i2]]];
        
        [_imgview3 setImage:[UIImage imageNamed:[imgArray objectAtIndex:i3]]];
        
        [_imgview4 setImage:[UIImage imageNamed:[imgArray objectAtIndex:i4]]];
        
        lable1.text = [NSString stringWithFormat:@"one:%d",lable11];
        lable2.text = [NSString stringWithFormat:@"two:%d",lable12];
        lable3.text = [NSString stringWithFormat:@"three:%d",lable13];
        lable4.text = [NSString stringWithFormat:@"four:%d",lable14];
    }//随机显示4个数字与图片
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtracTime)
                                           userInfo:nil
                                            repeats:YES];//计时器

}

-(void)setGame
{//初始化
    
    second = 0;
    count = 0;
    lableone.alpha=0.0;
    labletwo.alpha=0.0;
    lablethree.alpha=0.0;lableone.alpha=0.0;
    lable1.alpha=0.0;
    lable2.alpha=0.0;
    lable3.alpha=0.0;
    lable4.alpha=0.0;//隐藏
    lable1.text = [NSString stringWithFormat:@"one:%d",0];
    lable2.text = [NSString stringWithFormat:@"two:%d",0];
    lable3.text = [NSString stringWithFormat:@"three:%d",0];
    lable4.text = [NSString stringWithFormat:@"four:%d",0];
    [_imgview1 setImage:[UIImage imageNamed:@"0.png"]];
    
    [_imgview2 setImage:[UIImage imageNamed:@"0.png"]];
    
    [_imgview3 setImage:[UIImage imageNamed:@"0.png"]];
    
    [_imgview4 setImage:[UIImage imageNamed:@"0.png"]];
    
    timerLabel.text = [NSString stringWithFormat:@"倒计时:%d",second];
    scoreLabel.text = [NSString stringWithFormat:@"得分:%d",score];
    lable10.text =[NSString stringWithFormat:@"总时间:%d",lable18];
}

-(void)subtracTime
{//计时器
    if(count!=0){
        second+=1;
        lable18++;
    }
    timerLabel.text = [NSString stringWithFormat:@"Time:%d",second];
    if(second == 30)
    {
        [timer invalidate];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Times Out"
                                                                       message:[NSString stringWithFormat:@"Score:%d",score] preferredStyle:UIAlertControllerStyleAlert];
        
        scoreLabel.text = [NSString stringWithFormat:@"Score:%d",score];
        
        UIAlertAction *againAction = [UIAlertAction actionWithTitle:@"Again"
                                                              style:UIAlertActionStyleCancel
                                                            handler:nil];
        [alert addAction:againAction];
        [self presentViewController:alert animated:YES completion:nil];
        [self setGame];
    }
}
-(void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作数据失败!");
    }
}
- (void)database1{
    //数据库
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败");
    }
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, score INTEGER, time INTEGER)";
    NSLog(@"创表");
    [self execSql:sqlCreateTable];//插入初始数据
    NSString *sql1 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, SCORE, TIME, @"张三", @"1", @"20"];
    NSString *sql2 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, SCORE, TIME, @"老六", @"2", @"30"];
    NSString *sql3 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, SCORE, TIME, @"老4", @"4", @"37"];
    NSString *sql4 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, SCORE, TIME, @"老5", @"5", @"39"];

    [self execSql:sql1];
    [self execSql:sql2];
    [self execSql:sql3];
    [self execSql:sql4];
    NSString *sqlQuery = @"SELECT * FROM PERSONINFO ORDER BY score DESC";
    sqlite3_stmt * statement;
    NSMutableArray *dataArr = [[NSMutableArray alloc]init];
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name = (char*)sqlite3_column_text(statement, 1);
            NSString *nsNameStr = [[NSString alloc]initWithUTF8String:name];
            int scoree = sqlite3_column_int(statement, 2);
            int time = sqlite3_column_int(statement, 3);
            NSString *stuData = [NSString stringWithFormat:@"name:%@  score:%d  time:%d",nsNameStr,scoree, time];
            [dataArr addObject:stuData];
        }
    }
    sqlite3_close(db);
    lableone.text = [dataArr objectAtIndex: 0];
    labletwo.text = [dataArr objectAtIndex: 1];
    lablethree.text = [dataArr objectAtIndex: 2];
}
-(IBAction)buttonqc{
    //清除数据库里所有数据
    NSString *delete = @"delete from PERSONINFO";
    [self execSql:delete];
}

- (void)viewDidLoad {
    
    lable18 = 0;
    [super viewDidLoad];
    [self setGame];
    [self database1];
    _NameLabel.alpha=0.0;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
