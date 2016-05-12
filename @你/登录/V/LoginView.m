//
//  LoginView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/14.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#define kWight [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kMulriple [UIScreen mainScreen].bounds.size.width / 375.0
#define kHMulriple [UIScreen mainScreen].bounds.size.height / 667.0
#import "LoginView.h"
@implementation LoginView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.customerPhotoImageView];
        [self addSubview:self.accountNumberTF];
        [self addSubview:self.secretNumberTF];
        [self addSubview:self.forgetSecretBtn];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registBtn];
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    UIImageView *accountImage = [[UIImageView alloc] initWithFrame:CGRectMake(60 * kMulriple, 130 * kHMulriple, 25 * kMulriple, 25 * kHMulriple)];
    accountImage.image = [UIImage imageNamed:@"个人中心_用户名"];
    [self addSubview:accountImage];
    
    UIImageView *secretImage = [[UIImageView alloc] initWithFrame:CGRectMake(60 * kMulriple, 195 * kHMulriple, 25 * kMulriple, 25 * kHMulriple)];
    secretImage.image = [UIImage imageNamed:@"个人中心-修改密码"];
    [self addSubview:secretImage];
    
    UILabel *firstLineView = [[UILabel alloc] initWithFrame:CGRectMake(40 * kMulriple, 170 * kHMulriple, 295 * kMulriple, 1 * kHMulriple)];
    firstLineView.backgroundColor = RGB(249, 174, 161);
    [self addSubview:firstLineView];
    
    UILabel *secondLineView = [[UILabel alloc] initWithFrame:CGRectMake(40 * kMulriple, 230 * kHMulriple, 295 * kMulriple, 1 * kHMulriple)];
    secondLineView.backgroundColor = RGB(249, 174, 161);
    [self addSubview:secondLineView];
    

}

- (UIImageView *)customerPhotoImageView {
    if (!_customerPhotoImageView) {
        self.customerPhotoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(147 * kMulriple, 20 * kHMulriple, 80 * kMulriple, 80 * kHMulriple)];
        self.customerPhotoImageView.layer.cornerRadius = 40 * kMulriple;
        self.customerPhotoImageView.layer.masksToBounds = YES;
        self.customerPhotoImageView.backgroundColor = [UIColor orangeColor];
    }
    return _customerPhotoImageView;
}


- (UITextField *)accountNumberTF {
    if (!_accountNumberTF) {
        self.accountNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(100 * kMulriple, 130 * kHMulriple, 200 * kMulriple, 25 * kHMulriple)];
        self.accountNumberTF.placeholder = @"账号";
        self.accountNumberTF.borderStyle = UITextBorderStyleNone;
        [self.accountNumberTF setFont:[UIFont systemFontOfSize:15 * kMulriple]];
        
    }
    return _accountNumberTF;
}

- (UITextField *)secretNumberTF {
    if (!_secretNumberTF) {
        self.secretNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(100 * kMulriple, 195 * kHMulriple, 200 * kMulriple, 25 * kHMulriple)];
        self.secretNumberTF.borderStyle = UITextBorderStyleNone;
        self.secretNumberTF.placeholder = @"密码";
        [self.secretNumberTF setFont:[UIFont systemFontOfSize:15 * kMulriple]];
    }
    return _secretNumberTF;
}

- (UIButton *)forgetSecretBtn {
    if (!_forgetSecretBtn) {
        self.forgetSecretBtn = [[UIButton alloc] initWithFrame:CGRectMake(60 * kMulriple, 240 * kHMulriple, 60 * kMulriple, 20 * kHMulriple)];
        [self.forgetSecretBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [self.forgetSecretBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        self.forgetSecretBtn.titleLabel.font = [UIFont systemFontOfSize:13 * kMulriple];
    }
    return _forgetSecretBtn;

}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        self.loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(40 * kMulriple, 290 * kHMulriple, 295 * kMulriple, 50 * kHMulriple)];
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:18 * kMulriple];
        [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.loginBtn.backgroundColor = RGB(255, 84, 66);
        self.loginBtn.layer.cornerRadius = 20 * kMulriple;
        self.loginBtn.layer.masksToBounds = YES;
    }
    return _loginBtn;
}

- (UIButton *)registBtn {
    if (!_registBtn) {
        self.registBtn = [[UIButton alloc] initWithFrame:CGRectMake(40 * kMulriple, 360 * kHMulriple, 295 * kMulriple, 50 * kHMulriple)];
        [self.registBtn setTitle:@"注册" forState:UIControlStateNormal];
        [self.registBtn setTitleColor:RGB(249, 174, 161) forState:UIControlStateNormal];
        self.registBtn.layer.cornerRadius = 20 * kMulriple;
        self.registBtn.layer.masksToBounds = YES;
        self.registBtn.titleLabel.font = [UIFont systemFontOfSize:18 * kMulriple];
        [self.registBtn.layer setMasksToBounds:YES];
        [self.registBtn.layer setCornerRadius:20.0 * kMulriple]; //设置矩形四个圆角半径
        [self.registBtn.layer setBorderWidth:1.5 * kMulriple];   //边框宽度
        [self.registBtn.layer setBorderColor:RGB(249, 174, 161).CGColor];//边框颜色
    }
    return _registBtn;
}


@end
