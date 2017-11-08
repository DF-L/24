//
//  NextViewController.m
//  24
//
//  Created by kami on 2017/11/2.
//  Copyright © 2017年 kami. All rights reserved.
//
#import "NextViewController.h"

@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)blockAction:(UIButton *)sender {
  
    self.change(self.nameTextField.text);
    [self dismissViewControllerAnimated:YES completion:^{

    }];
}



@end
