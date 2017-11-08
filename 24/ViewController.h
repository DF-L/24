//
//  ViewController.h
//  24
//
//  Created by kami on 2017/11/2.
//  Copyright © 2017年 kami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface ViewController : UIViewController
{
    IBOutlet UILabel *scoreLabel;//分数框
    IBOutlet UILabel *timerLabel;//倒计时框
    IBOutlet UILabel *lable1;//第一个随机数
    IBOutlet UILabel *lable2;//第二个随机数
    IBOutlet UILabel *lable3;//第三个随机数
    IBOutlet UILabel *lable4;//第四个随机数
    IBOutlet UILabel *lable10;//总时间框
    IBOutlet UILabel *lableone;//第一名用户信息
    IBOutlet UILabel *labletwo;//第二名用户信息
    IBOutlet UILabel *lablethree;//第三名用户信息

    
    int count;
    int second;
    int score;
    int lable11;
    int lable12;
    int lable13;
    int lable14;
    int lable18;
    int bol;
    sqlite3 *db;
    NSTimer *timer;
}

@property (nonatomic, retain) IBOutlet UITextField *showText;//输入框
@property (nonatomic, retain) IBOutlet UIImageView *imgview1;//第一个随机数对应的扑克牌
@property (nonatomic, retain) IBOutlet UIImageView *imgview2;//第二个随机数对应的扑克牌
@property (nonatomic, retain) IBOutlet UIImageView *imgview3;//第三个随机数对应的扑克牌
@property (nonatomic, retain) IBOutlet UIImageView *imgview4;//第四个随机数对应的扑克牌




-(IBAction)buttonPressed;//开始
-(IBAction)buttonsave;//保存
-(IBAction)buttonre;//重新开始
-(IBAction)buttonjisuan;//计算
-(IBAction)buttonqc;//清除
-(IBAction)buttonph;//排行榜
-(void)setGame;
-(void)subtracTime;

@end

