//
//  ScanNaViewController.m
//  @你
//
//  Created by 王赛 on 16/4/12.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "ScanNaViewController.h"
#import "SubLBXScanViewController.h"
@interface ScanNaViewController ()

@end

@implementation ScanNaViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //1.设置self.tabBarController.tabBar.hidden=YES;
    
//    self.tabBarController.tabBar.hidden=YES;

    //2.如果在push跳转时需要隐藏tabBar，设置self.hidesBottomBarWhenPushed=YES;
    
//    self.hidesBottomBarWhenPushed=YES;
   
   
    //并在push后设置self.hidesBottomBarWhenPushed=NO;
    //这样back回来的时候，tabBar会恢复正常显示。
    
    
    SubLBXScanViewController *vc = [SubLBXScanViewController new];
    [self pushViewController:vc animated:YES];
    
    self.hidesBottomBarWhenPushed=NO;
    
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
