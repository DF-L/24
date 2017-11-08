//
//  newview.m
//  24
//
//  Created by kami on 2017/11/5.
//  Copyright © 2017年 kami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "newview.h"

@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
//代理
- (IBAction)delegateAction:(UIButton *)sender {
    
    if (![self.nameTextField.text isEqualToString:@""]) {
        NSLog(@"%@",self.nameTextField.text);
        [self.delegate changeName:self.nameTextField.text]; //写在前面或写在dismiss的Block中都可以
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)blockAction:(UIButton *)sender {
    
    //block 方法1
    self.change(self.nameTextField.text); //写在前面或写在dismiss的Block中都可以
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)blockTwoAction:(UIButton *)sender {
    
    //block 方法2
    self.changeName(self.nameTextField.text);   //写在前面或写在dismiss的Block中都可以
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//block 方法2
-(void)ChangeName:(ChangeLastPageName)block
{
    self.changeName=block;
}


//通知中心发送通知
- (IBAction)NSNotificationAction:(UIButton *)sender {
    
    NSDictionary* dic=@{@"名字":self.nameTextField.text};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"改变名称" object:nil userInfo:dic];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
@end

