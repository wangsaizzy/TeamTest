//
//  AlertSecretController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/16.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "AlertSecretController.h"
#import "AlertSecretView.h"
@interface AlertSecretController ()

@end

@implementation AlertSecretController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置新密码";
    [self setupViews];
}

- (void)setupViews {
    AlertSecretView *alertSecretView = [[AlertSecretView alloc] initWithFrame:self.view.bounds];
    alertSecretView.backgroundColor = RGB(237, 237, 237);
    self.view = alertSecretView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
