//
//  ViewController.m
//  text
//
//  Created by hanlu on 16/7/30.
//  Copyright © 2016年 吴迪. All rights reserved.
//

#import "SaoleiViewController.h"
#import "SaoleiView.h"


#import "SaveHandle.h"
#import "PaihangViewController.h"
@interface SaoleiViewController ()
/**
 *  用户选择的点击方式
 */
@property (nonatomic,assign) BOOL firstClick;
/**
 *  还剩余的雷数(用来控制左侧计数面板的显示数字)
 */
@property (nonatomic,assign) NSInteger numberOfLeiExist;
/**
 *  雷存在的总数
 */
@property (nonatomic,assign) NSInteger numberOfLei;
/**
 *  用来控制右侧计时面板的显示时间
 */
@property (nonatomic,assign) NSInteger timeInterval;
/**
 *  右侧计时面板定时器
 */
@property (nonatomic,strong) NSTimer *timer;
/**
 *  扫雷主视图
 */
@property (nonatomic,strong) SaoleiView *saoleiView;
/**
 *  扫雷头部视图
 */

/**
 *  扫雷选择视图
 */


@property (nonatomic,copy) NSString *userName;
/**
 *  难度(中级16X16 40个雷，初级8X8 10个雷)
 */
@property (nonatomic,assign) KindOfUserDifficulty difficulty;



@property (nonatomic,strong) PaihangViewController *paihangVC;

@property (nonatomic,assign) NSInteger randomNum;

@end

@implementation SaoleiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _firstClick = YES;
    
    [self setupUI];
    
    self.userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    
    self.difficulty = [[[NSUserDefaults standardUserDefaults] objectForKey:@"difficulty"] integerValue];
}

- (void)setupUI {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择难度" style:(UIBarButtonItemStylePlain) target:self action:@selector(popView)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"排行榜" style:(UIBarButtonItemStylePlain) target:self action:@selector(popPaihang)];
    
    SaoleiView *view = [[SaoleiView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame)) NumberOfChessInLine:0 NumberOfChessInList:0 ViewController:self];
    
    view.center = CGPointMake(self.view.center.x, self.view.center.y  + 50 * [UIScreen mainScreen].bounds.size.height / 736);
    
    self.saoleiView = view;
    
    [self.view addSubview:view];
    
    
    }

-(void)popPaihang{
    _paihangVC = [[PaihangViewController alloc] init];
    
    _paihangVC.randomNum = self.randomNum;
    
    _paihangVC.difficulty = self.difficulty;
    
    _paihangVC.modalPresentationStyle = UIModalPresentationPopover;
    
    //设置依附的按钮
    _paihangVC.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    
    //可以指示小箭头颜色
    _paihangVC.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    
    //content尺寸
    _paihangVC.preferredContentSize = CGSizeMake(400, 400);
    
    //pop方向
    _paihangVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    //delegate
    _paihangVC.popoverPresentationController.delegate = self;
    
    [self presentViewController:_paihangVC animated:YES completion:nil];
}



@end
