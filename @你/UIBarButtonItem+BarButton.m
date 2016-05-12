//
//  UIBarButtonItem+BarButton.m
//  vipshop
//
//  Created by Mind is important  on 15/12/12.
//  Copyright © 2015年 iovo. All rights reserved.
//

#import "UIBarButtonItem+BarButton.h"
#import "MYButton.h"

@implementation UIBarButtonItem (BarButton)
+ (UIBarButtonItem*)barButtonItemWithIcon:(NSString*)icon Target:(id)target Action:(SEL)action
{
    MYButton *button = [MYButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    button.contentMode = UIViewContentModeCenter;
    button.frame = CGRectMake(0, 0, 30, 30);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:button];
}
@end
