//
//  ConnectPhoneView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/16.
//  Copyright © 2016年 吴明飞. All rights reserved.
//
#define kWight [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kMulriple [UIScreen mainScreen].bounds.size.width / 375.0
#define kHMulriple [UIScreen mainScreen].bounds.size.height / 667.0

#import "ConnectPhoneView.h"

@implementation ConnectPhoneView
//初始化
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加提交修改按钮到view上
        [self addSubview:self.commitBtn];
        //自定义视图
        [self setupViews];
        //设置view的背景色
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)setupViews {
    
    //输入新手机号视图
    UIView *phoneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 80 * kHMulriple)];
    phoneView.backgroundColor = [UIColor whiteColor];
    //新手机号label
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 30 * kHMulriple, 70 * kMulriple, 20 * kHMulriple)];
    phoneLabel.text = @"新手机号";
    
    //分割线view
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 78 * kHMulriple, kWight, 1 * kHMulriple)];
    lineView.backgroundColor = RGB(237, 237, 237);
    [phoneView addSubview:lineView];
    [phoneView addSubview:phoneLabel];
    [phoneView addSubview:self.phoneNumberTF];
    [phoneView addSubview:self.acquireTestBtn];
    [self addSubview:phoneView];
    
    
    
    
    UIView *testSectetView = [[UIView alloc] initWithFrame:CGRectMake(0, 80 * kHMulriple, kWight, 80 * kHMulriple)];
    testSectetView.backgroundColor = [UIColor whiteColor];
    [self addSubview:testSectetView];
    UILabel *secretLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 30 * kHMulriple, 60 * kMulriple, 20 * kHMulriple)];
    secretLabel.text  =@"验证码";
    [testSectetView addSubview:self.bringTestNumberTF];
    [testSectetView addSubview:secretLabel];
    
}

//输入新手机号编辑框布局
- (UITextField *)phoneNumberTF {
    if (!_phoneNumberTF) {
        self.phoneNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(105 * kMulriple, 25 * kHMulriple, 115 * kMulriple, 30 * kHMulriple)];
        self.phoneNumberTF.placeholder = @"请输入手机号";
        self.phoneNumberTF.font = [UIFont systemFontOfSize:18 * kMulriple];
    }
    return _phoneNumberTF;
}

//获取验证码按钮布局
- (UIButton *)acquireTestBtn {
    if (!_acquireTestBtn) {
        self.acquireTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(245 * kMulriple, 15 * kHMulriple, 105 * kMulriple, 50 * kHMulriple)];
        self.acquireTestBtn.backgroundColor = [UIColor orangeColor];
        [self.acquireTestBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.acquireTestBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.acquireTestBtn.layer.cornerRadius = 5 * kMulriple;
        self.acquireTestBtn.layer.masksToBounds = YES;
    }
    return _acquireTestBtn;
}

//输入验证码编辑框布局
- (UITextField *)bringTestNumberTF {
    if (!_bringTestNumberTF) {
        self.bringTestNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(105 * kMulriple, 25 * kHMulriple, 115 * kMulriple, 30 * kHMulriple)];
        self.bringTestNumberTF.placeholder = @"请输入验证码";
        self.bringTestNumberTF.font = [UIFont systemFontOfSize:18 * kMulriple];
    }
    return _bringTestNumberTF;
}

//提交修改按钮布局
- (UIButton *)commitBtn {
    if (!_commitBtn) {
        self.commitBtn = [[UIButton alloc] initWithFrame:CGRectMake(60 * kMulriple, 180 * kHMulriple, 255 * kMulriple, 50 * kHMulriple)];
        self.commitBtn.backgroundColor = [UIColor redColor];
        [self.commitBtn setTitle:@"提交修改" forState:UIControlStateNormal];
        self.commitBtn.layer.cornerRadius = 5 * kMulriple;
        self.commitBtn.layer.masksToBounds = YES;
    }
    return _commitBtn;
}


@end
