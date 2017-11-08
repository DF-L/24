//
//  CALayer+LayerColor.m
//  24
//
//  Created by kami on 2017/11/7.
//  Copyright © 2017年 kami. All rights reserved.
//

#import "CALayer+LayerColor.h"

@implementation CALayer (LayerColor)


- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
   }
@end
