//
//  person.m
//  24
//
//  Created by kami on 2017/11/6.
//  Copyright © 2017年 kami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "person.h"


@implementation Person : NSObject



//直接实现静态方法，获取带有name和age的Person对象

+(Person *)personWithScore:(int)score withName:(NSString *)name withTime:(NSInteger)time{

    Person *person = [[Person alloc] init];
    
    person.time = time;
    
    person.name = name;
    person.score =score;
    return person;
    
}
-(NSComparisonResult)comparePerson:(Person *)person{
    
    //默认按年龄排序
    
    NSComparisonResult result = [[NSNumber numberWithInt:person.score] compare:[NSNumber numberWithInt:self.score]];//注意:基本数据类型要进行数据转换
    
    //如果年龄一样，就按照名字排序
    
    if
        (result == NSOrderedSame) {
            
            result = [[NSNumber numberWithInt:person.time] compare:[NSNumber numberWithInt:self.time]];
            
        }
    
    return result;
    
}

@end
