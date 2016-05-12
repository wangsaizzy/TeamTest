//
//  BingDingNumberController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/25.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "BingDingNumberController.h"
#import "BingDingBankCardController.h"
#import "BangDingZhiFuBaoController.h"
@interface BingDingNumberController ()

@end

@implementation BingDingNumberController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定体现账号";
    self.themeColor = RGB(239, 143, 49);
    self.leftMenuTitle = @"绑定支付宝账号";
    self.rightMenuTitle = @"绑定银行卡账号";
    self.leftViewController = [BangDingZhiFuBaoController new];
    self.rightViewController = [BingDingBankCardController new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
