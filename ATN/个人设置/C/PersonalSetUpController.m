//
//  PersonalSetUpController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/11.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "PersonalSetUpController.h"
#import "PersonalSetUpView.h"
#import "BackAdviseController.h"
@interface PersonalSetUpController ()


@end

@implementation PersonalSetUpController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setUpNavigationCustom];
    self.title = @"个人设置";
    [self setUpViews];
}


- (void)setUpViews {
    PersonalSetUpView *setUpView = [[PersonalSetUpView alloc] initWithFrame:self.view.bounds];
    self.view = setUpView;
    
    //检查更新按钮点击事件
    [setUpView.checkUpdateBtn addTarget:self action:@selector(checkUpdateBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //清除缓存按钮点击事件
    [setUpView.cleanCacheBtn addTarget:self action:@selector(cleanCacheBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //意见反馈按钮点击事件
    [setUpView.backAdviseBtn addTarget:self action:@selector(backAdviseBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //关于我们按钮点击事件
    [setUpView.aboutUsBtn addTarget:self action:@selector(aboutUsBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -检查更新按钮点击事件
- (void)checkUpdateBtnAction:(UIButton *)sender {
    
}

#pragma mark -清除缓存按钮点击事件
- (void)cleanCacheBtnAction:(UIButton *)sender {
    
}

#pragma mark -意见反馈按钮点击事件
- (void)backAdviseBtnAction:(UIButton *)sender {
    BackAdviseController *backVC = [[BackAdviseController alloc] init];
    [self.navigationController pushViewController:backVC animated:YES];
}


#pragma mark -关于我们按钮点击事件
- (void)aboutUsBtnAction:(UIButton *)sender {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
