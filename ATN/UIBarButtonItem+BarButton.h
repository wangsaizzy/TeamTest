//
//  UIBarButtonItem+BarButton.h
//  vipshop
//
//  Created by Mind is important  on 15/12/12.
//  Copyright © 2015年 iovo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BarButton)
+ (UIBarButtonItem*)barButtonItemWithIcon:(NSString*)icon Target:(id)target Action:(SEL)action;
@end
