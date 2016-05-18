//
//  TestStatusView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/16.
//  Copyright © 2016年 吴明飞. All rights reserved.
//
#define kWight [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kMulriple [UIScreen mainScreen].bounds.size.width / 375.0
#define kHMulriple [UIScreen mainScreen].bounds.size.height / 667.0

#import "TestStatusView.h"

@implementation TestStatusView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.testStatusBtn];
        [self setupViews];
        self.backgroundColor = RGB(237, 237, 237);
    }
    return self;
}

- (void)setupViews {
    UIView *textView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 60 * kHMulriple)];
    textView.backgroundColor = [UIColor whiteColor];
    [self addSubview:textView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 335 * kMulriple, 60 * kHMulriple)];
    textLabel.text = @"请输入手机号并获取验证码，我们将给您的手机发送一条验证短信。请在5分钟内填写验证码完成验证。";
    textLabel.textColor = RGB(150, 150, 150);
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:14];
    CGSize size = CGSizeMake(335, 666);
    CGSize requiredSize = CGSizeZero;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14 * kMulriple]};
    requiredSize = [textLabel.text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    textLabel.frame = CGRectMake(20 * kMulriple, 15 * kHMulriple, 335 * kMulriple, requiredSize.height);
    [textView addSubview:textLabel];
    
    
    UIView *phoneView = [[UIView alloc] initWithFrame:CGRectMake(0, 70 * kHMulriple, kWight, 65 * kHMulriple)];
    phoneView.backgroundColor = [UIColor whiteColor];
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 60 * kMulriple, 35 * kHMulriple)];
    phoneLabel.textColor = RGB(111, 111, 111);
    phoneLabel.text = @"手机号";
    
    //分割线
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 63.5 * kHMulriple, kWight, 2 * kHMulriple)];
    lineLabel.backgroundColor = RGB(237, 237, 237);
     [phoneView addSubview:lineLabel];
    [phoneView addSubview:phoneLabel];
    [phoneView addSubview:self.phoneNumberTF];
    [phoneView addSubview:self.acquireTestBtn];
    [self addSubview:phoneView];
    
    
    
    
    UIView *testSectetView = [[UIView alloc] initWithFrame:CGRectMake(0, 135 * kHMulriple, kWight, 65 * kHMulriple)];
    testSectetView.backgroundColor = [UIColor whiteColor];
    [self addSubview:testSectetView];
    
   
    UILabel *secretLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 60 * kMulriple, 35 * kHMulriple)];
    secretLabel.text  =@"验证码";
    secretLabel.textColor = RGB(111, 111, 111);
    [testSectetView addSubview:self.bringTestNumberTF];
    [testSectetView addSubview:secretLabel];
   
}

- (UITextField *)phoneNumberTF {
    if (!_phoneNumberTF) {
        self.phoneNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(95 * kMulriple, 15 * kHMulriple, 115 * kMulriple, 35 * kHMulriple)];
        self.phoneNumberTF.placeholder = @"请输入手机号";
        self.phoneNumberTF.font = [UIFont systemFontOfSize:18 * kMulriple];
    }
    return _phoneNumberTF;
}

- (UIButton *)acquireTestBtn {
    if (!_acquireTestBtn) {
        self.acquireTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(245 * kMulriple, 7.5 * kHMulriple, 105 * kMulriple, 50 * kHMulriple)];
        self.acquireTestBtn.backgroundColor = [UIColor orangeColor];
        [self.acquireTestBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.acquireTestBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.acquireTestBtn.layer.cornerRadius = 5 * kMulriple;
        self.acquireTestBtn.layer.masksToBounds = YES;
    }
    return _acquireTestBtn;
}

- (UITextField *)bringTestNumberTF {
    if (!_bringTestNumberTF) {
        self.bringTestNumberTF = [[UITextField alloc] initWithFrame:CGRectMake(95 * kMulriple, 15 * kHMulriple, 115 * kMulriple, 35 * kHMulriple)];
        self.bringTestNumberTF.placeholder = @"请输入验证码";
        self.bringTestNumberTF.font = [UIFont systemFontOfSize:18 * kMulriple];
    }
    return _bringTestNumberTF;
}

- (UIButton *)testStatusBtn {
    if (!_testStatusBtn) {
        self.testStatusBtn = [[UIButton alloc] initWithFrame:CGRectMake(60 * kMulriple, 225 * kHMulriple, 255 * kMulriple, 50 * kHMulriple)];
        self.testStatusBtn.backgroundColor = [UIColor redColor];
        [self.testStatusBtn setTitle:@"验证身份" forState:UIControlStateNormal];
        self.testStatusBtn.layer.cornerRadius = 25 * kMulriple;
        self.testStatusBtn.layer.masksToBounds = YES;
    }
    return _testStatusBtn;
}
@end
