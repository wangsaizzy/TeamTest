//
//  RegistView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/15.
//  Copyright © 2016年 吴明飞. All rights reserved.
//


#import "RegistView.h"

@implementation RegistView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.phoneNumberTF];
        [self addSubview:self.bringTestNumberTF];
        [self addSubview:self.setUpSecretTF];
        [self addSubview:self.acquireBtn];
        [self addSubview:self.registBtn];
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    NSArray *imageArr = @[@"个人中心_用户名", @"个人中心-修改密码", @"个人中心-密码"];
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60 * kMulriple, 50 * kHMulriple + i * 65 * kHMulriple, 25 * kMulriple, 25 * kHMulriple)];
        imageView.image = [UIImage imageNamed:imageArr[i]];
        [self addSubview:imageView];
        
        UILabel *lineView = [[UILabel alloc] initWithFrame:CGRectMake(40 * kMulriple, 85 * kHMulriple + i * 65 * kHMulriple, 295 * kMulriple, 1 * kHMulriple)];
        lineView.backgroundColor = RGB(249, 174, 161);
        [self addSubview:lineView];
    }
}

- (UITextField *)phoneNumberTF {
    if (!_phoneNumberTF) {
        self.phoneNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(100 * kMulriple, 50 * kHMulriple, 120 * kMulriple, 25 * kHMulriple)];
        self.phoneNumberTF.borderStyle = UITextBorderStyleNone;
        self.phoneNumberTF.placeholder = @"18501011770";
        [self.phoneNumberTF setFont:[UIFont systemFontOfSize:17 * kMulriple]];
    }
    return _phoneNumberTF;
}

- (UIButton *)acquireBtn {
    if (!_acquireBtn) {
        self.acquireBtn = [[UIButton alloc] initWithFrame:CGRectMake(230 * kMulriple, 35 * kHMulriple, 105 * kMulriple, 40 * kHMulriple)];
       
        self.acquireBtn.backgroundColor = [UIColor orangeColor];
        [self.acquireBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.acquireBtn.titleLabel.font = [UIFont systemFontOfSize:18 * kMulriple];
        [self.acquireBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.acquireBtn.layer.cornerRadius = 5 * kMulriple;
        self.acquireBtn.layer.masksToBounds = YES;
        
    }
    return _acquireBtn;
}

- (UITextField *)bringTestNumberTF {
    if (!_bringTestNumberTF) {
        self.bringTestNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(100 * kMulriple, 115 * kHMulriple, 140 * kMulriple, 25 * kHMulriple)];
        self.bringTestNumberTF.borderStyle = UITextBorderStyleNone;
        self.bringTestNumberTF.placeholder = @"输入验证码";
        [self.bringTestNumberTF setFont:[UIFont systemFontOfSize:17 * kMulriple]];
    }
    return _bringTestNumberTF;
}

- (UITextField *)setUpSecretTF {
    if (!_setUpSecretTF) {
        self.setUpSecretTF = [[UITextField alloc] initWithFrame:CGRectMake(100 * kMulriple, 180 * kHMulriple, 140 * kMulriple, 25 * kHMulriple)];
        self.setUpSecretTF.borderStyle = UITextBorderStyleNone;
        self.setUpSecretTF.placeholder = @"设置密码";
        [self.setUpSecretTF setFont:[UIFont systemFontOfSize:17 * kMulriple]];
    }
    return _setUpSecretTF;
}

- (UIButton *)registBtn {
    if (!_registBtn) {
        self.registBtn = [[UIButton alloc] initWithFrame:CGRectMake(40 * kMulriple, 265 * kHMulriple, 295 * kMulriple, 50 * kHMulriple)];
        [self.registBtn setTitle:@"注册" forState:UIControlStateNormal];
        self.registBtn.titleLabel.font = [UIFont systemFontOfSize:18 * kMulriple];
        [self.registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.registBtn.backgroundColor = RGB(255, 84, 66);
        self.registBtn.layer.cornerRadius = 20 * kMulriple;
        self.registBtn.layer.masksToBounds = YES;
    }
    return _registBtn;
}

@end
