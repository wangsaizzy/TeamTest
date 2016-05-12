//
//  AlertPaySecretController.m
//  @你
//
//  Created by 吴明飞 on 16/4/28.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "AlertPaySecretController.h"
#import "AlertPaySecretView.h"
@interface AlertPaySecretController () <AlertPaySecretViewDelegate, UITextFieldDelegate>

{
    AlertPaySecretView *_payView;
}

@end

@implementation AlertPaySecretController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    
    self.title = @"修改支付密码";
    
    self.view.backgroundColor = RGB(238, 238, 238);
    
    _payView = [[AlertPaySecretView alloc] initWithFrame:CGRectMake(0, 0, kWight, 200 * kHMulriple) WithTitle:@"请输入六位数字支付密码"];
    _payView.delegate = self;
    
    if (![_payView.TF becomeFirstResponder]) {
        
        //成为第一响应者
        [_payView.TF becomeFirstResponder];
        
    }
    
    [self.view addSubview:_payView];
}

#pragma mark  密码输入结束后调用此方法

- (void)AlertPaySecretView:(AlertPaySecretView *)view WithPasswordString:(NSString *)password {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
