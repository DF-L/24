//
//  NextViewController.h
//  24
//
//  Created by kami on 2017/11/2.
//  Copyright © 2017年 kami. All rights reserved.
//


#import <UIKit/UIKit.h>
@protocol ChangeName  //协议
-(void)changeName:(NSString*)string;
@end




@interface NextViewController : UIViewController
@property (nonatomic,weak)id<ChangeName>delegate;




@property (nonatomic,copy) void (^change)(NSString* stringName);







@end
