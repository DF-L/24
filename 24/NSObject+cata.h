//
//  NSObject+cata.h
//  24
//
//  Created by kami on 2017/11/7.
//  Copyright © 2017年 kami. All rights reserved.
//

#import <Foundation/Foundation.h>




#import <QuartzCore/QuartzCore.h>

#import <UIKit/UIKit.h>

@interface CALayer (Additions)

@property(nonatomic, strong) UIColor *borderColorFromUIColor;

- (void)setBorderColorFromUIColor:(UIColor *)color;

@end


