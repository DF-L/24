//
//  SaoleiView.h
//  text
//
//  Created by hanlu on 16/8/1.
//  Copyright © 2016年 吴迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SaoleiViewController;

@interface SaoleiView : UIView

@property (nonatomic,assign) NSInteger numberOfChessInLine;

@property (nonatomic,assign) NSInteger numberOfChessInList;

@property (nonatomic,weak) SaoleiViewController *vc;

- (instancetype)initWithFrame:(CGRect)frame NumberOfChessInLine:(NSInteger)numberOfChessInLine NumberOfChessInList:(NSInteger)numberOfChessInList ViewController:(SaoleiViewController *)vc;



- (void)getRestarted;

- (void)showAll;

- (void)resetView;

@end
