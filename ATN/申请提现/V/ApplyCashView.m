//
//  ApplyCashView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/28.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "ApplyCashView.h"

@implementation ApplyCashView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.applyCashBtn];
        [self setupViews];
        
        self.backgroundColor = RGB(238, 238, 238);
    }
    return self;
}

- (void)setupViews {
    
    //上面两个自定义cell
    NSArray *firstLabelArr = @[@"可用余额", @"提现账户"];
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 130 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    [firstView addSubview:self.cashLabel];
    [firstView addSubview:self.accountLabel];
    for (int i = 0; i < 2; i++) {
        UILabel *textFirstLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple + i * 65 * kHMulriple, 85 * kMulriple, 35 * kHMulriple)];
        textFirstLabel.text = firstLabelArr[i];
        [firstView addSubview:textFirstLabel];
    }
    //分割线
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64 * kHMulriple, kWight, 1 * kHMulriple)];
    lineLabel.backgroundColor = RGB(237, 237, 237);
    [firstView addSubview:lineLabel];
    
    [self addSubview:firstView];
    
    //下面三个自定义cell
    NSArray *secondLabelArr = @[@"提现金额", @"登录密码", @"验证码"];
     UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 150 * kHMulriple, kWight, 195 * kHMulriple)];
    secondView.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < 3; i++) {
        UILabel *textSecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple + i * 65 * kHMulriple, 85 * kMulriple, 35 * kHMulriple)];
        textSecondLabel.text = secondLabelArr[i];
        [secondView addSubview:textSecondLabel];
    }
    
    //下面两个分割线
    for (int i = 0; i < 2; i++) {
        UILabel *lineSecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64 * kHMulriple + i * 65 * kHMulriple, kWight, 1 * kHMulriple)];
        lineSecondLabel.backgroundColor = RGB(237, 237, 237);
        [secondView addSubview:lineSecondLabel];
    }
    
    [secondView addSubview:self.cashTF];
    [secondView addSubview:self.secretTF];
    [secondView addSubview:self.testTF];
    [secondView addSubview:self.acquireBtn];
    [self addSubview:secondView];
}

#pragma mark -懒加载

- (UILabel *)cashLabel {
    if (!_cashLabel) {
        self.cashLabel = [[UILabel alloc] initWithFrame:CGRectMake(125 * kMulriple, 15 * kHMulriple, 240 * kMulriple, 35 * kHMulriple)];
        self.cashLabel.text = @"￥666.888";
        self.cashLabel.textColor = [UIColor redColor];
    }
    return _cashLabel;
}

- (UILabel *)accountLabel {
    if (!_accountLabel) {
        self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(125 * kMulriple, 80 * kHMulriple, 240 * kMulriple, 35 * kHMulriple)];
        self.accountLabel.text = @"888888888888@qq.com";
        
    }
    return _accountLabel;
}

- (UITextField *)cashTF {
    if (!_cashTF) {
        self.cashTF = [[UITextField alloc] initWithFrame:CGRectMake(125 * kMulriple, 15 * kHMulriple, 240 * kMulriple, 35 * kHMulriple)];
        self.cashTF.placeholder = @"请输入提现金额";
        self.cashTF.borderStyle = UITextBorderStyleNone;
        [self.cashTF setFont:[UIFont systemFontOfSize:18 * kMulriple]];
        
    }
    return _cashTF;
}

- (UITextField *)secretTF {
    if (!_secretTF) {
        self.secretTF = [[UITextField alloc] initWithFrame:CGRectMake(125 * kMulriple, 80 * kHMulriple, 240 * kMulriple, 35 * kHMulriple)];
        self.secretTF.placeholder = @"请输入登录密码";
        self.secretTF.borderStyle = UITextBorderStyleNone;
        [self.secretTF setFont:[UIFont systemFontOfSize:18 * kMulriple]];
    }
    return _secretTF;
}

- (UITextField *)testTF {
    if (!_testTF) {
        self.testTF = [[UITextField alloc] initWithFrame:CGRectMake(125 * kMulriple, 145 * kHMulriple, 122 * kMulriple, 35 * kHMulriple)];
        self.testTF.placeholder = @"请输入验证码";
        self.testTF.borderStyle = UITextBorderStyleNone;
        [self.testTF setFont:[UIFont systemFontOfSize:18 * kMulriple]];
    }
    return _testTF;
}

- (UIButton *)acquireBtn {
    if (!_acquireBtn) {
        self.acquireBtn = [[UIButton alloc] initWithFrame:CGRectMake(255 * kMulriple, 140 * kHMulriple, 100 * kMulriple, 45 * kHMulriple)];
        [self.acquireBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.acquireBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.acquireBtn.layer.masksToBounds = YES;
        self.acquireBtn.layer.cornerRadius = 5 * kMulriple;
        self.acquireBtn.backgroundColor = RGB(255, 154, 54);
    }
    return _acquireBtn;
}

- (UIButton *)applyCashBtn {
    if (!_applyCashBtn) {
        self.applyCashBtn = [[UIButton alloc] initWithFrame:CGRectMake(70 * kMulriple, 365 * kHMulriple, 235 * kMulriple, 55 * kHMulriple)];
        [self.applyCashBtn setTitle:@"申请提现" forState:UIControlStateNormal];
        [self.applyCashBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.applyCashBtn.layer.masksToBounds = YES;
        self.applyCashBtn.layer.cornerRadius = 5 * kMulriple;
        self.applyCashBtn.backgroundColor = RGB(255, 84, 66);
    }
    return _applyCashBtn;
}

@end
