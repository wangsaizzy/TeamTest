//
//  RootViewController.h
//  vipshop
//
//  Created by Mind is important  on 15/12/12.
//  Copyright © 2015年 iovo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CenterViewControllerCheckleftBarButtonItemDelegate <NSObject>
@optional
- (void)checkleftBarButtonItemRootViewController:(UIViewController*)viewController;
@end
@interface CenterViewController : UIViewController

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, assign) NSInteger indexOfBtn;

@property (nonatomic, assign) BOOL isPush;
@end
