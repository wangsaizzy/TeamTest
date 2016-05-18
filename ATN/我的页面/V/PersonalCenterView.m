//
//  PersonalCenterView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/29.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "PersonalCenterView.h"

@implementation PersonalCenterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        
        self.backgroundColor = RGB(238, 238, 238);
    }
    return self;
}

- (void)setupViews {
    
    /*
      第1个View
     
     
    */
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 255 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    //第一行自定义Cell
    UIImageView *directFirstImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 35 * kHMulriple, 15 * kMulriple, 20 * kHMulriple)];
    [directFirstImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.personalDataBtn addSubview:directFirstImage];
    [self.personalDataBtn addSubview:self.headImageView];
    [self.personalDataBtn addSubview:self.nickLabel];
    [self.personalDataBtn addSubview:self.accountNumberLabel];
    
    //第二行自定义cell
    //Label
    UILabel *consumerTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(60 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    consumerTextLabel.text = @"消费记录";
    consumerTextLabel.textColor = RGB(111, 111, 111);
    //UIImageView
    UIImageView *consumerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 25 * kMulriple, 35 * kHMulriple)];
    consumerImageView.image = [UIImage imageNamed:@"个人中心-消费记录"];
    
    //查看预约记录label
    UILabel *lookNotesLabel = [[UILabel alloc] initWithFrame:CGRectMake(225 * kMulriple, 15 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
    lookNotesLabel.text = @"查看预约记录";
    lookNotesLabel.font = [UIFont systemFontOfSize:15 * kMulriple];
    lookNotesLabel.textColor = RGB(111, 111, 111);
    
    //右箭头
    UIImageView *consumerDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [consumerDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.consumerNotesBtn addSubview:consumerTextLabel];
    [self.consumerNotesBtn addSubview:consumerImageView];
    [self.consumerNotesBtn addSubview:consumerDirectImage];
    [self.consumerNotesBtn addSubview:lookNotesLabel];
    
    //第三行自定义cell
    //Label
    UILabel *collectTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(60 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    collectTextLabel.text = @"收藏夹";
    collectTextLabel.textColor = RGB(111, 111, 111);
    //UIImageView
    UIImageView *collectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 30 * kMulriple, 30 * kHMulriple)];
    collectImageView.image = [UIImage imageNamed:@"个人中心-收藏夹"];
    
    //右箭头
    UIImageView *collectDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [collectDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.collectListBtn addSubview:collectTextLabel];
    [self.collectListBtn addSubview:collectImageView];
    [self.collectListBtn addSubview:collectDirectImage];
    
    //第四行自定义cell
    //Label
    UILabel *alertTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(60 * kMulriple, 15 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
    alertTextLabel.text = @"修改支付密码";
    alertTextLabel.textColor = RGB(111, 111, 111);
    //UIImageView
    UIImageView *alertImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 25 * kMulriple, 35 * kHMulriple)];
    alertImageView.image = [UIImage imageNamed:@"个人中心-修改密码"];
    
    //右箭头
    UIImageView *alertDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [alertDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.alertSecretBtn addSubview:alertTextLabel];
    [self.alertSecretBtn addSubview:alertImageView];
    [self.alertSecretBtn addSubview:alertDirectImage];
    
    
    for (int i = 0; i < 3; i++) {
        //分割线
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 89 * kHMulriple + i * 55 * kHMulriple, kWight, 1 * kHMulriple)];
        lineLabel.backgroundColor = RGB(237, 237, 237);
        [firstView addSubview:lineLabel];
    }
    
    [firstView addSubview:self.personalDataBtn];
    [firstView addSubview:self.consumerNotesBtn];
    [firstView addSubview:self.collectListBtn];
    [firstView addSubview:self.alertSecretBtn];
    [self addSubview:firstView];
    
    /*
     第2个View
     
     
     */
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 265 * kHMulriple, kWight, 110 * kHMulriple)];
    secondView.backgroundColor = [UIColor whiteColor];
    //第一行cell
    //Label
    UILabel *contactTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(60 * kMulriple, 15 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
    contactTextLabel.text = @"联系客服";
    contactTextLabel.textColor = RGB(111, 111, 111);
    //UIImageView
    UIImageView *contactImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 30 * kMulriple, 35 * kHMulriple)];
    contactImageView.image = [UIImage imageNamed:@"个人中心-联系客服"];
    
    //右箭头
    UIImageView *contactDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [contactDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    
    [self.contactServiceBtn addSubview:contactTextLabel];
    [self.contactServiceBtn addSubview:contactImageView];
    [self.contactServiceBtn addSubview:contactDirectImage];
    
    //第二行cell
    //Label
    UILabel *shopTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(60 * kMulriple, 15 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
    shopTextLabel.text = @"商家入驻";
    shopTextLabel.textColor = RGB(111, 111, 111);
    //UIImageView
    UIImageView *shopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 30 * kMulriple, 35 * kHMulriple)];
    shopImageView.image = [UIImage imageNamed:@"个人中心-商家入驻"];
    
    //右箭头
    UIImageView *shopDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [shopDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    
    [self.addShoperBtn addSubview:shopTextLabel];
    [self.addShoperBtn addSubview:shopImageView];
    [self.addShoperBtn addSubview:shopDirectImage];
    //分割线
    UILabel *lineSecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 54 * kHMulriple , kWight, 1 * kHMulriple)];
    lineSecondLabel.backgroundColor = RGB(237, 237, 237);
    [secondView addSubview:lineSecondLabel];
    [secondView addSubview:self.contactServiceBtn];
    [secondView addSubview:self.addShoperBtn];
    [self addSubview:secondView];
    
    /*
     第3个View
     
     
     */
    UIView *thirdView = [[UIView alloc] initWithFrame:CGRectMake(0, 385 * kHMulriple, kWight, 55 * kHMulriple)];
    thirdView.backgroundColor = [UIColor whiteColor];
    //自定义cell
    //Label
    UILabel *backTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(60 * kMulriple, 15 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
    backTextLabel.text = @"退出登录";
    backTextLabel.textColor = RGB(111, 111, 111);
    //UIImageView
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 30 * kMulriple, 30 * kHMulriple)];
    backImageView.image = [UIImage imageNamed:@"个人中心-退出"];
    [self.backLoginBtn addSubview:backTextLabel];
    [self.backLoginBtn addSubview:backImageView];
    [thirdView addSubview:self.backLoginBtn];
    [self addSubview:thirdView];
}

#pragma mark -懒加载
//头像
- (UIImageView *)headImageView {
    if (!_headImageView) {
        self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 60 * kMulriple, 60 * kHMulriple)];
        self.headImageView.backgroundColor = [UIColor orangeColor];
        self.headImageView.layer.masksToBounds = YES;
        self.headImageView.layer.cornerRadius = 30 * kMulriple;
    }
    return _headImageView;
}

//昵称
- (UILabel *)nickLabel {
    if (!_nickLabel) {
        self.nickLabel = [[UILabel alloc] initWithFrame:CGRectMake(90 * kMulriple, 15 * kHMulriple, 200 * kMulriple, 25 * kHMulriple)];
        self.nickLabel.text = @"Amey";
        self.nickLabel.textColor = RGB(111, 111, 111);
        self.nickLabel.font = [UIFont systemFontOfSize:19 * kMulriple];
    }
    return _nickLabel;
}

//账号/手机号
- (UILabel *)accountNumberLabel {
    if (!_accountNumberLabel) {
        self.accountNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(90 * kMulriple, 55 * kHMulriple, 160 * kMulriple, 20 * kHMulriple)];
        self.accountNumberLabel.text = @"188 8888 6666";
        self.accountNumberLabel.textColor = RGB(111, 111, 111);
        self.accountNumberLabel.font = [UIFont systemFontOfSize:18 * kMulriple];
    }
    return _accountNumberLabel;
}

//个人资料按钮
- (UIButton *)personalDataBtn {
    if (!_personalDataBtn) {
        self.personalDataBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWight, 90 * kHMulriple)];
    }
    return _personalDataBtn;
}

//消费记录按钮
- (UIButton *)consumerNotesBtn {
    if (!_consumerNotesBtn) {
        self.consumerNotesBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 90 * kHMulriple, kWight, 55 * kHMulriple)];
    }
    return _consumerNotesBtn;
}

//收藏夹按钮
- (UIButton *)collectListBtn {
    if (!_collectListBtn) {
        self.collectListBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 145 * kHMulriple, kWight, 55 * kHMulriple)];
    }
    return _collectListBtn;
}

//修改支付密码按钮
- (UIButton *)alertSecretBtn {
    if (!_alertSecretBtn) {
        self.alertSecretBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200 * kHMulriple, kWight, 55 * kHMulriple)];
    }
    return _alertSecretBtn;
}

//联系商家按钮
- (UIButton *)contactServiceBtn {
    if (!_contactServiceBtn) {
        self.contactServiceBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWight, 55 * kHMulriple)];
    }
    return _contactServiceBtn;
}

//商家入驻按钮
- (UIButton *)addShoperBtn {
    if (!_addShoperBtn) {
        self.addShoperBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 55 * kHMulriple, kWight, 55 * kHMulriple)];
    }
    return _addShoperBtn;
}

//退出登录按钮
- (UIButton *)backLoginBtn {
    if (!_backLoginBtn) {
        self.backLoginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWight, 55 * kHMulriple)];
    }
    return _backLoginBtn;
}
@end
