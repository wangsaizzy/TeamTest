//
//  MainTabBarController.m
//  ATN
//
//  Created by 王赛 on 16/3/28.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "MainTabBarController.h"
#import "WSCommon.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    /*设置tabbar*/
    [self SetTabBarimages];
}


/**
 *  设置tabbar
 */
-(void)SetTabBarimages
{
    //改变tabar背景颜色
    UIView *backview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    backview.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    NSArray *TabBarSubView = [[self tabBar] subviews];
    for (UIView *CurrentView in TabBarSubView) {
        NSInteger tabBarItemTag = [CurrentView tag];
        if (tabBarItemTag == 100)
        {
            //remove old bgcolorview
            [CurrentView removeFromSuperview];
            break;
        }
        
    }
    [self.tabBar insertSubview:backview atIndex:0];
    
    //    //去掉tabbar顶部的黑色线条
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"baixian"]];
    [self.tabBar setShadowImage:[UIImage imageNamed:@"baixian"]];
    
    //显示图片真实颜色
    self.tabBar.tintColor = [UIColor colorWithRed:250.0/255.0 green:200.0/255.0 blue:100.0/255.0 alpha:1.0];
    
    
    UITabBarItem *item0 = [self.tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [self.tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [self.tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [self.tabBar.items objectAtIndex:3];
    UITabBarItem *item4 = [self.tabBar.items objectAtIndex:4];
    
    //设置uitabbaritem属性
    //    NSString *const UITextAttributeFont;
    //   [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Marion-Italic" size:20.0]} forState:UIControlStateNormal];
    //
    //设置TabBarItem的字体大小及颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Marion-Italic" size:20.0F], NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    
    
    
    /**
     *  设置对应item  image
     */
    
    //首页
    item0.selectedImage = [[UIImage imageNamed:@"home_r"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//防止图片被渲染 参见末尾注释
    item0.image = [[UIImage imageNamed:@"home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item0 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:135.0/255.0 green:135.0/255.0 blue:135.0/255.0 alpha:1.0],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    //发现
    item1.selectedImage = [[UIImage imageNamed:@"faxian_r"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//防止图片被渲染 参见末尾注释
    item1.image = [[UIImage imageNamed:@"faxian"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:135.0/255.0 green:135.0/255.0 blue:135.0/255.0 alpha:1.0],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    
    //扫一扫
    item2.selectedImage = [[UIImage imageNamed:@"scan"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//防止图片被渲染 参见末尾注释
    item2.image = [[UIImage imageNamed:@"scan"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    
    //聚宝盆
    item3.selectedImage = [[UIImage imageNamed:@"money_r"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//防止图片被渲染 参见末尾注释
    item3.image = [[UIImage imageNamed:@"money"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item3 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:135.0/255.0 green:135.0/255.0 blue:135.0/255.0 alpha:1.0],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    
    //我
    item4.selectedImage = [[UIImage imageNamed:@"me_r"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//防止图片被渲染 参见末尾注释
    item4.image = [[UIImage imageNamed:@"me"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item4 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:135.0/255.0 green:135.0/255.0 blue:135.0/255.0 alpha:1.0],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
