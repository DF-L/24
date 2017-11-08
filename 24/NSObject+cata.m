//
//  NSObject+cata.m
//  24
//
//  Created by kami on 2017/11/7.
//  Copyright © 2017年 kami. All rights reserved.
//

#import "NSObject+cata.h"


#import <objc/runtime.h>

@implementation CALayer (Additions)

//static const void *borderColorFromUIColorKey = &borderColorFromUIColorKey;

//@dynamic borderColorFromUIColor;


-(void)setBorderUIColor:(UIColor*)color

{
    
    self.borderColor = color.CGColor;
    
}

-(UIColor*)borderUIColor

{
    
    return [UIColor colorWithCGColor:self.borderColor];
    
}

@end


