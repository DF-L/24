//
//  newview.h
//  24
//
//  Created by kami on 2017/11/5.
//  Copyright © 2017年 kami. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChangeName  //协议
-(void)changeName:(NSString*)string;
@end


typedef void (^ChangeLastPageName)(NSString* stringName); //block 写法2


@interface NextViewController : UIViewController
@property (nonatomic,weak)id<ChangeName>delegate; //代理




@property (nonatomic,copy) void (^change)(NSString* stringName);//block 写法1






@property (nonatomic,copy)ChangeLastPageName changeName; //block 写法2
-(void)ChangeName:(ChangeLastPageName)block; //block 写法2



@end
