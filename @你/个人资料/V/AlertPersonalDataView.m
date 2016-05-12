//
//  AlertPersonalDataView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/15.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "AlertPersonalDataView.h"

@implementation AlertPersonalDataView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        
        self.backgroundColor = RGB(251, 251, 251);
    }
    return self;
}

- (void)setupViews {
    
    /*
     第1个View
     
     
     */
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 90 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    //第一行自定义Cell
    UILabel *headTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 30 * kHMulriple, 85 * kMulriple, 30 * kHMulriple)];
    headTextLabel.text = @"头像";
    headTextLabel.textColor = RGB(111, 111, 111);
    //分割线
    UILabel *lineFirstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 89 * kHMulriple, kWight, 1.5 * kHMulriple)];
    lineFirstLabel.backgroundColor = RGB(237, 237, 237);
    [firstView addSubview:headTextLabel];
    [firstView addSubview:lineFirstLabel];
    [firstView addSubview:self.headImageBtn];
    [self.headImageBtn addSubview:self.headPhotoImage];
    [self addSubview:firstView];
    
    
    /*
     第2个View
     
     
     */
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 90 * kHMulriple, kWight, 220 * kHMulriple)];
    secondView.backgroundColor = [UIColor whiteColor];
    //第1行自定义cell
    //view
    UIView *baseDataView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 45 * kHMulriple)];
    baseDataView.backgroundColor = RGB(251, 251, 251);
    //Label
    UILabel *baseTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    baseTextLabel.text = @"基本资料";
    baseTextLabel.textColor = RGB(111, 111, 111);
    baseTextLabel.font = [UIFont systemFontOfSize:13 * kMulriple];
    [baseDataView addSubview:baseTextLabel];
    [secondView addSubview:baseDataView];
    
    
    //第2行自定义cell
    //view
    UIView *nickView = [[UIView alloc] initWithFrame:CGRectMake(0, 45 * kHMulriple, kWight, 65 * kHMulriple)];
    //Label
    UILabel *nickTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 35 * kHMulriple)];
    nickTextLabel.text = @"昵称";
    nickTextLabel.textColor = RGB(111, 111, 111);
    [nickView addSubview:nickTextLabel];
    [nickView addSubview:self.nickTF];
    [secondView addSubview:nickView];
    
    //第3行自定义cell
    //view
    UIView *sexView = [[UIView alloc] initWithFrame:CGRectMake(0, 110 * kHMulriple, kWight, 65 * kHMulriple)];
    
    //Label
    UILabel *sexTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 35 * kHMulriple)];
    sexTextLabel.text = @"性别";
    sexTextLabel.textColor = RGB(111, 111, 111);
    //右箭头
    UIImageView *sexDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [sexDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.sexBtn addSubview:sexTextLabel];
    [self.sexBtn addSubview:sexDirectImage];
    [self.sexBtn addSubview:self.sexLabel];
    [sexView addSubview:self.sexBtn];
    [secondView addSubview:sexView];
    
    //第4行自定义cell
    //view
    UIView *proviteView = [[UIView alloc] initWithFrame:CGRectMake(0, 175 * kHMulriple, kWight, 45 * kHMulriple)];
    proviteView.backgroundColor = RGB(251, 251, 251);
    //Label
    UILabel *proviteTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    proviteTextLabel.text = @"隐私";
    proviteTextLabel.textColor = RGB(111, 111, 111);
    proviteTextLabel.font = [UIFont systemFontOfSize:13 * kMulriple];
    [proviteView addSubview:proviteTextLabel];
    [secondView addSubview:proviteView];
    
    for (int i = 0; i < 3; i++) {
        //分割线
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 44 * kHMulriple + i * 64 * kHMulriple, kWight, 1.5 * kHMulriple)];
        lineLabel.backgroundColor = RGB(237, 237, 237);
        [secondView addSubview:lineLabel];
    }
    
    [self addSubview:secondView];
    /*
     第3个View
     
     
     */
    UIView *thirdView = [[UIView alloc] initWithFrame:CGRectMake(0, 310 * kHMulriple, kWight, 130 * kHMulriple)];
    thirdView.backgroundColor = [UIColor whiteColor];
    //第一行cell
    //Label
    UILabel *phoneTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 35 * kHMulriple)];
    phoneTextLabel.text = @"手机账号";
    phoneTextLabel.textColor = RGB(111, 111, 111);
    //右箭头
    UIImageView *phoneDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [phoneDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    
    [self.connectPhoneBtn addSubview:phoneTextLabel];
    [self.connectPhoneBtn addSubview:phoneDirectImage];
    [self.connectPhoneBtn addSubview:self.phoneLabel];
    [thirdView addSubview:self.connectPhoneBtn];
    
    //第一行cell
    //Label
    UILabel *secretTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 35 * kHMulriple)];
    secretTextLabel.text = @"登录密码";
    secretTextLabel.textColor = RGB(111, 111, 111);
    //右箭头
    UIImageView *secretDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [secretDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.alertSecretBtn addSubview:secretTextLabel];
    [self.alertSecretBtn addSubview:secretDirectImage];
    
    [thirdView addSubview:self.alertSecretBtn];
    
    //分割线
    for (int i = 0; i < 2; i++) {
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, i * 64 * kHMulriple, kWight, 1.5 * kHMulriple)];
        lineLabel.backgroundColor = RGB(237, 237, 237);
        [thirdView addSubview:lineLabel];
    }

    [self addSubview:thirdView];

}

- (UIImageView *)headPhotoImage {
    if (!_headPhotoImage) {
        self.headPhotoImage = [[UIImageView alloc] initWithFrame:CGRectMake(147 * kMulriple, 10 * kHMulriple, 70 * kMulriple, 70 * kHMulriple)];
        self.headPhotoImage.backgroundColor = [UIColor orangeColor];
        self.headPhotoImage.layer.masksToBounds = YES;
        self.headPhotoImage.layer.cornerRadius = 35 * kMulriple;
    }
    return _headPhotoImage;
}

- (UIButton *)headImageBtn {
    
    if (!_headImageBtn) {
        self.headImageBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        //_headImageBtn.frame = CGRectMake(147 * kMulriple, 10 * kHMulriple, 70 * kMulriple, 70 * kHMulriple);
        _headImageBtn.frame = CGRectMake(0, 0, kWight, 90 * kHMulriple);
        _headImageBtn.layer.masksToBounds = YES;
        _headImageBtn.layer.cornerRadius = 35 * kMulriple;
    }
    return _headImageBtn;
    
}


- (UITextField *)nickTF {
    if (!_nickTF) {
        self.nickTF = [[UITextField alloc] initWithFrame:CGRectMake(140 * kMulriple, 15 * kHMulriple, 240 * kMulriple, 35 * kHMulriple)];
        _nickTF.text = @"AngleBoby";
        _nickTF.textColor = RGB(111, 111, 111);
    }
    return _nickTF;
}

- (UILabel *)sexLabel {
    if (!_sexLabel) {
        self.sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(140 * kMulriple, 15 * kHMulriple, 240 * kMulriple, 35 * kHMulriple)];
        self.sexLabel.text = @"女";
        self.sexLabel.textColor = RGB(111, 111, 111);
    }
    return _sexLabel;
}

- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        self.phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(140 * kMulriple, 15 * kHMulriple, 140 * kMulriple, 35 * kHMulriple)];
        self.phoneLabel.text = @"156****8962";
        self.phoneLabel.textColor = RGB(111, 111, 111);
    }
    return _phoneLabel;
}

//选择性别
- (UIButton *)sexBtn {
    if (!_sexBtn) {
        _sexBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWight, 65 * kHMulriple)];
    }
    return _sexBtn;
}

- (UIButton *)alertBaseDataBtn {
    if (!_alertBaseDataBtn) {
        self.alertBaseDataBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.alertBaseDataBtn.frame = CGRectMake(325 * kMulriple, 10 * kHMulriple, 30 * kMulriple, 25 * kHMulriple);
        [self.alertBaseDataBtn setTitle:@"修改" forState:UIControlStateNormal];
    }
    return _alertBaseDataBtn;
}

- (UIButton *)connectPhoneBtn {
    if (!_connectPhoneBtn) {
        self.connectPhoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWight, 65 * kHMulriple)];
    }
    return _connectPhoneBtn;
}

- (UIButton *)alertSecretBtn {
    if (!_alertSecretBtn) {
        self.alertSecretBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 65 * kHMulriple, kWight, 65 * kHMulriple)];
    }
    return _alertSecretBtn;
}

@end
