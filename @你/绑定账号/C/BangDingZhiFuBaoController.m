//
//  BangDingZhiFuBaoController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/25.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "BangDingZhiFuBaoController.h"
#import "DrawMoneyController.h"
#import "BangDingZhiFuBaoView.h"
@interface BangDingZhiFuBaoController ()
@property (nonatomic, strong) BangDingZhiFuBaoView *bangDingView;
@end

@implementation BangDingZhiFuBaoController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    //设置导航控制器不隐藏
    self.navigationController.navigationBarHidden = NO;
    //关闭毛玻璃效果
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义视图
    [self setupViews];
}

- (void)setupViews {
    self.bangDingView = [[BangDingZhiFuBaoView alloc] initWithFrame:self.view.bounds];
    self.bangDingView.backgroundColor = RGB(237, 237, 237);
    
    //添加点击事件
    [self.bangDingView.commitBtn addTarget:self action:@selector(commitBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.view = self.bangDingView;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    NSString *accountNumberStr = self.bangDingView.accountNumberTF.text;
    //添加通知传值
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:accountNumberStr forKey:@"ACCOUNTNUMBER"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"accountNumber" object:self userInfo:userInfo];
}

#pragma mark -提交按钮
- (void)commitBtnAction:(UIButton *)sender {

    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *accountNumberStr = [userDefault stringForKey:@"accountNumberStr"];
    accountNumberStr = self.bangDingView.accountNumberTF.text;
    //将上面的数据存储到NSUserDefaults
    [userDefault setObject:accountNumberStr forKey:@"accountNumberStr"];
    
    [userDefault synchronize];
    
    //返回上一页面
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
