//
//  DrawMoneyView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/28.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "DrawMoneyView.h"
#import "UIView+Addition.h"
@implementation DrawMoneyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        
        self.backgroundColor = RGB(238, 238, 238);
    }
    return self;
}

- (void)setupViews {
    
    //顶部视图
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 130 * kHMulriple)];
    headView.backgroundColor = [UIColor orangeColor];
    
    //显示提现余额框
    self.cashLabel.centerX = headView.width / 2;
    
    //可提余额提示框
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80 * kHMulriple, 100 * kMulriple, 25 * kHMulriple)];
    textLabel.text = @"可提余额";
    textLabel.centerX = headView.width / 2;
    textLabel.textColor = [UIColor whiteColor];
    [headView addSubview:textLabel];
    
    //将显示余额框添加到顶部视图
   [headView addSubview:self.cashLabel];
    
    [self addSubview:headView];
    
    //提示view
    UIView *promptView = [[UIView alloc] initWithFrame:CGRectMake(0, 465 * kHMulriple, kWight, 20 * kHMulriple)];
    UILabel *promptLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * kMulriple, 0, 355 * kMulriple, 20 * kHMulriple)];
    promptLabel.text = @"如果您的信息有误或者发生更变，请及时联系业务经理进行更改!";
    promptLabel.textColor = RGB(159, 159, 159);
    promptLabel.font = [UIFont systemFontOfSize:13 * kMulriple];
    [promptView addSubview:promptLabel];
    [self addSubview:promptView];

    
    
    //上面3个自定义cell
   
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 130 * kHMulriple, kWight, 195 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    //添加三个label
    NSArray *firstLabelArr = @[@"结算方式", @"最低打款金额", @"提现账号"];
    for (int i = 0; i < 3; i++) {
        UILabel *textFirstLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple + i * 65 * kHMulriple, 115 * kMulriple, 35 * kHMulriple)];
        textFirstLabel.text = firstLabelArr[i];
        if (i == 2) {
            [self.accountBtn addSubview:textFirstLabel];
        }
        [firstView addSubview:textFirstLabel];
        
    }
    
    //上面面两个分割线
    NSArray *textSecondArr = @[@"3天周期结款", @"￥10"];
    for (int i = 0; i < 2; i++) {
        UILabel *lineSecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64 * kHMulriple + i * 65 * kHMulriple, kWight, 1 * kHMulriple)];
        lineSecondLabel.backgroundColor = RGB(237, 237, 237);
        [firstView addSubview:lineSecondLabel];
        
        UILabel *textSecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(155 * kMulriple, 15 * kHMulriple + i * 65 * kHMulriple, 200 * kMulriple, 35 * kHMulriple)];
        textSecondLabel.text = textSecondArr[i];
        textSecondLabel.textAlignment = NSTextAlignmentRight;
        [firstView addSubview:textSecondLabel];
    }
    
    //第三个自定义cell
    self.bangDingLabel = [[UILabel alloc] initWithFrame:CGRectMake(205 * kMulriple, 15 * kHMulriple, 125 * kMulriple, 35 * kHMulriple)];
    self.bangDingLabel.text = @"请绑定提现账号";
    self.bangDingLabel.textColor = RGB(247, 139, 139);
    
    [self.accountBtn addSubview:self.bangDingLabel];
    
    self.directFirstImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 35 * kHMulriple)];
    [self.directFirstImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.accountBtn addSubview:self.directFirstImage];
    [self.accountBtn addSubview:self.accountLabel];
    [firstView addSubview:self.accountBtn];
    [self addSubview:firstView];
    
    
    
    
    
    //下面2个自定义cell
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 330 * kHMulriple, kWight, 130 * kHMulriple)];
    secondView.backgroundColor = [UIColor whiteColor];
    
    //申请提现label
    UILabel *textApplySecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 35 * kHMulriple)];
    textApplySecondLabel.text = @"申请提现";
    [self.applyCashBtn addSubview:textApplySecondLabel];
    self.directApplyFirstImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 35 * kHMulriple)];
    [self.directApplyFirstImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.applyCashBtn addSubview:self.directApplyFirstImage];
    
    //历史提现label
    UILabel *textHistorySecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 35 * kHMulriple)];
    textHistorySecondLabel.text = @"历史提现";
    
    self.directHistorySecondImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 35 * kHMulriple)];
    [self.directHistorySecondImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    
    [self.historyCashBtn addSubview:textHistorySecondLabel];
    [self.historyCashBtn addSubview:self.directHistorySecondImage];
    
    //分割线
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64 * kHMulriple, kWight, 1 * kHMulriple)];
    lineLabel.backgroundColor = RGB(237, 237, 237);
    [secondView addSubview:lineLabel];
    
    [secondView addSubview:self.applyCashBtn];
    [secondView addSubview:self.historyCashBtn];
    [self addSubview:secondView];
}

#pragma mark -懒加载

//显示余额label
- (UILabel *)cashLabel {
    if (!_cashLabel) {
        self.cashLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 25 * kHMulriple, 160 * kMulriple, 40 * kHMulriple)];
        //显示提现余额框
        self.cashLabel.text = @"￥123.456";
        self.cashLabel.textColor = RGB(255, 233, 151);
        self.cashLabel.font = [UIFont systemFontOfSize:25 * kMulriple];
    }
    return _cashLabel;
}

//提现账号label
- (UILabel *)accountLabel {
    if (!_accountLabel) {
        self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(155 * kMulriple, 15 * kHMulriple, 200 * kMulriple, 35 * kHMulriple)];
        self.accountLabel.text = @"888888888888@qq.com";
        self.accountLabel.textAlignment = NSTextAlignmentRight;
        
    }
    return _accountLabel;
}

//绑定账号按钮
- (UIButton *)accountBtn {
    if (!_accountBtn) {
        self.accountBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 130 * kHMulriple, kWight, 65 * kHMulriple)];
    }
    return _accountBtn;
}

//历史提现按钮
- (UIButton *)historyCashBtn {
    if (!_historyCashBtn) {
        self.historyCashBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 65, kWight, 65 * kHMulriple)];
    }
    return _historyCashBtn;
}

//申请提现按钮
- (UIButton *)applyCashBtn {
    if (!_applyCashBtn) {
        self.applyCashBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWight, 65 * kHMulriple)];
    }
    return _applyCashBtn;
}

@end
