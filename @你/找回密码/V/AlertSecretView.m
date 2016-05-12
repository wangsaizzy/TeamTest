//
//  AlertSecretView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/16.
//  Copyright © 2016年 吴明飞. All rights reserved.
//


#import "AlertSecretView.h"

@implementation AlertSecretView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        [self addSubview:self.commitBtn];
    }
    return self;
}

- (void)setupViews {
    
    UIView *newSecretView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 65 * kHMulriple)];
    newSecretView.backgroundColor = [UIColor whiteColor];
    UILabel *newSecretLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 70 * kMulriple, 35 * kHMulriple)];
    newSecretLabel.text = @"新密码";
    newSecretLabel.font = [UIFont systemFontOfSize:17 * kMulriple];
    newSecretLabel.textColor = RGB(111, 111, 111);
    
    UILabel *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, 63.5 * kHMulriple, kWight, 1.5 * kHMulriple)];
    lineView.backgroundColor = RGB(237, 237, 237);
    [newSecretView addSubview:lineView];
    [newSecretView addSubview:newSecretLabel];
    [newSecretView addSubview:self.SecretNumberTF];
    [self addSubview:newSecretView];
    
    
    
    
    UIView *testSectetView = [[UIView alloc] initWithFrame:CGRectMake(0, 65 * kHMulriple, kWight, 65 * kHMulriple)];
    testSectetView.backgroundColor = [UIColor whiteColor];
    [self addSubview:testSectetView];
    
    
    UILabel *secretLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 75 * kMulriple, 35 * kHMulriple)];
    secretLabel.text  =@"确认密码";
    secretLabel.font = [UIFont systemFontOfSize:17 * kMulriple];
    secretLabel.textColor = RGB(111, 111, 111);
    [testSectetView addSubview:self.reSetSecretNumberTF];
    [testSectetView addSubview:secretLabel];
}

- (UITextField *)SecretNumberTF {
    if (!_SecretNumberTF) {
        self.SecretNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(125 * kMulriple, 15 * kHMulriple, 180 * kMulriple, 35 * kHMulriple)];
        self.SecretNumberTF.placeholder = @"请设置新密码";
        self.SecretNumberTF.borderStyle = UITextBorderStyleNone;
        
        [self.SecretNumberTF setFont:[UIFont systemFontOfSize:18 * kMulriple]];
    }
    return _SecretNumberTF;
}

- (UITextField *)reSetSecretNumberTF {
    if (!_reSetSecretNumberTF) {
        self.reSetSecretNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(125 * kMulriple, 15 * kHMulriple, 180 * kMulriple, 35 * kHMulriple)];
        self.reSetSecretNumberTF.placeholder = @"请再输入一遍新密码";
        self.reSetSecretNumberTF.borderStyle = UITextBorderStyleNone;
        [self.reSetSecretNumberTF setFont:[UIFont systemFontOfSize:18 * kMulriple]];
    }
    return _reSetSecretNumberTF;
}

- (UIButton *)commitBtn {
    if (!_commitBtn) {
        self.commitBtn = [[UIButton alloc] initWithFrame:CGRectMake(60 * kMulriple, 160 * kHMulriple, 255 * kMulriple, 50 * kHMulriple)];
        [self.commitBtn setTitle:@"提交修改" forState:UIControlStateNormal];
        self.commitBtn.layer.cornerRadius = 25 * kMulriple;
        self.commitBtn.layer.masksToBounds = YES;
        self.commitBtn.backgroundColor = [UIColor redColor];
        [self.commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _commitBtn;
}

@end
