//
//  person.h
//  24
//
//  Created by kami on 2017/11/6.
//  Copyright © 2017年 kami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface Person :NSObject{
    NSString *_name;//姓名，默认值是nil:空指针，可以查看定义:#define nil NULL
    NSInteger _score;
    NSInteger _time;//年龄，默认值是0
}
- (NSString *)name;
- (NSInteger)score;
- (NSInteger)time;

- (void)setName:(NSString *)name;
- (void)setScore:(NSInteger)score;
- (void)setTime:(NSInteger)time;

- (void)setName:(NSString *)name setScore:(NSInteger)score setTime:(NSInteger)time;
+(Person *)personWithScore:(int) age withName:(NSString *)name withTime:(NSInteger)time;
-(NSComparisonResult)comparePerson:(Person *)person;
@end
