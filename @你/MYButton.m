//
//  MYButton.m
//  vipshop
//
//  Created by Mind is important  on 15/12/12.
//  Copyright (c) 2015年 iovo. All rights reserved.
//

#import "MYButton.h"

@implementation MYButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

+ (instancetype)myButton:(CGRect)frame
{
    return [[self alloc]initWithFrame:frame];
}
@end
