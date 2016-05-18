//
//  ListDetailView.m
//  ATN
//
//  Created by 吴明飞 on 16/4/27.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "ListDetailView.h"

@implementation ListDetailView

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
     第一个自定义View
     
     
     */
    
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 80 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    [firstView addSubview:self.headImageView];
    [firstView addSubview:self.nameLabel];
    
    
    [self addSubview:firstView];
    
    
    /*
     第二个自定义View
     
     
     */
    
     UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 85 * kHMulriple, kWight,  175 * kHMulriple)];
     secondView.backgroundColor = [UIColor whiteColor];
    
    
    
    //Label
    NSArray *titleArr = @[@"用户电话", @"消费内容", @"时  间", @"单  号"];
    for (int i = 0; i < 4; i++) {
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple + i * 40 * kHMulriple, 80 * kMulriple, 25 * kHMulriple)];
        contentLabel.text = titleArr[i];
        contentLabel.textColor = RGB(111, 111, 111);
        [secondView addSubview:contentLabel];
    }
    
    [secondView addSubview:self.phoneLabel];
    [secondView addSubview:self.consumeLabel];
    [secondView addSubview:self.timeLabel];
    [secondView addSubview:self.listNumLabel];
    
    [self addSubview:secondView];
    
    /*
     第三个自定义View
     
     
     */
    
    
     UIView *thirdView = [[UIView alloc] initWithFrame:CGRectMake(0, 270 * kHMulriple, kWight,  110 * kHMulriple)];
     thirdView.backgroundColor = [UIColor whiteColor];
    
    //Label
    UILabel *tranformCashTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 80 * kMulriple, 25 * kHMulriple)];
    
    tranformCashTextLabel.text = @"交易金额";
    tranformCashTextLabel.textColor = RGB(111, 111, 111);
    
    [thirdView addSubview:self.priceLabel];
    [thirdView addSubview:self.totalLabel];
    
    [thirdView addSubview:tranformCashTextLabel];
    
    [self addSubview:thirdView];
    
    
    
    
}

#pragma mark -懒加载

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(85 * kMulriple, 25 * kHMulriple, 240 * kMulriple, 30 * kHMulriple)];
        _nameLabel.text = @"五十多家饭店开飞机的空间";
        _nameLabel.textColor = RGB(111, 111, 111);
    }
    return _nameLabel;
}

//手机号Label
- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        self.phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * kMulriple, 15 * kHMulriple, 240 * kMulriple, 25 * kHMulriple)];
        _phoneLabel.textAlignment = NSTextAlignmentRight;
        _phoneLabel.text = @"18754826688";
        _phoneLabel.textColor = RGB(111, 111, 111);
    }
    return _phoneLabel;
}

//头像
- (UIImageView *)headImageView {
    if (!_headImageView) {
        self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 50 * kMulriple, 50 * kHMulriple)];
        self.headImageView.backgroundColor = [UIColor orangeColor];
        self.headImageView.layer.masksToBounds = YES;
        self.headImageView.layer.cornerRadius = 25 * kMulriple;
    }
    return _headImageView;
}

//消费内容
- (UILabel *)consumeLabel {
    if (!_consumeLabel) {
        self.consumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * kMulriple, 55 * kHMulriple, 240 * kMulriple, 25 * kHMulriple)];
        _consumeLabel.textAlignment = NSTextAlignmentRight;
        _consumeLabel.text = @"线下消费";
        _consumeLabel.textColor = RGB(111, 111, 111);
    }
    return _consumeLabel;
}

//时间
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * kMulriple, 95 * kHMulriple, 240 * kMulriple, 25 * kHMulriple)];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.text = @"2016-02-23 09:23:34";
        _timeLabel.textColor = RGB(111, 111, 111);
    }
    return _timeLabel;
}

//单号
- (UILabel *)listNumLabel {
    if (!_listNumLabel) {
        self.listNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * kMulriple, 135 * kHMulriple, 240 * kMulriple, 25 * kHMulriple)];
        _listNumLabel.textAlignment = NSTextAlignmentRight;
        _listNumLabel.text = @"23445567809877666655";
        _listNumLabel.textColor = RGB(111, 111, 111);
    }
    return _listNumLabel;
}

//交易金额
- (UILabel *)priceLabel {
    if (!_priceLabel) {
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * kMulriple, 15 * kHMulriple, 240 * kMulriple, 25 * kHMulriple)];
        _priceLabel.textAlignment = NSTextAlignmentRight;
        _priceLabel.text = @"￥118.00";
        _priceLabel.textColor = RGB(111, 111, 111);
    }
    return _priceLabel;
}

//总金额
- (UILabel *)totalLabel {
    if (!_totalLabel) {
        self.totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70 * kHMulriple, 350 * kMulriple, 25 * kHMulriple)];
        _totalLabel.textAlignment = NSTextAlignmentRight;
        _totalLabel.text = @"合计: ￥118.00(实入￥99.4)";
        
        _totalLabel.textColor = [UIColor redColor];
    }
    return _totalLabel;
}


@end
