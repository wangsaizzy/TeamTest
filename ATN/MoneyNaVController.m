//
//  MoneyNaVController.m
//  ATN
//
//  Created by 王赛 on 16/4/22.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "MoneyNaVController.h"
#import "MoneyTVController.h"
@interface MoneyNaVController ()

@end

@implementation MoneyNaVController

- (void)viewDidLoad {
    [super viewDidLoad];


   
    
    MoneyTVController *moneyTVC = [MoneyTVController new];
    [self pushViewController:moneyTVC animated:YES];
    
    
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
