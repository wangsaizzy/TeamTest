//
//  FindNaVController.m
//  @你
//
//  Created by 王赛 on 16/4/28.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "FindNaVController.h"
#import "LZPageViewController.h"
#import "shopPageTVController.h"
#import "goodsPageTVController.h"

@interface FindNaVController ()

@end

@implementation FindNaVController

- (void)viewDidLoad {
    [super viewDidLoad];

    LZPageViewController *pageVc = [[LZPageViewController alloc] initWithTitles:@[@"好店",@"好物",] controllersClass:@[[shopPageTVController class],[goodsPageTVController class]]];
    [self pushViewController:pageVc animated:YES];


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
