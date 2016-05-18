//
//  CaiWuDuiZhangCell.m
//  ATN
//
//  Created by 吴明飞 on 16/4/27.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "CaiWuDuiZhangCell.h"

@implementation CaiWuDuiZhangCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.dayLabel];
        [self addSubview:self.weekLabel];
        [self addSubview:self.posterImageView];
        [self addSubview:self.priceLabel];
        [self addSubview:self.typeLabel];
        
        
    }
    return self;
}

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        self.dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 50 * kMulriple, 30 * kHMulriple)];
        _dayLabel.text = @"28号";
        _dayLabel.textColor = RGB(111, 111, 111);
        _dayLabel.font = [UIFont systemFontOfSize:20 * kMulriple];
    }
    return _dayLabel;
}

- (UILabel *)weekLabel {
    if (!_weekLabel) {
        self.weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 45 * kHMulriple, 30 * kMulriple, 15 * kHMulriple)];
        _weekLabel.text = @"周日";
        _weekLabel.textColor = RGB(111, 111, 111);
        _weekLabel.font = [UIFont systemFontOfSize:14 * kMulriple];
    }
    return _weekLabel;
}

- (UIImageView *)posterImageView {
    if (!_posterImageView) {
        self.posterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(85 * kMulriple, 10 * kHMulriple, 60 * kMulriple, 60 * kHMulriple)];
        _posterImageView.image = [UIImage imageNamed:@"2商家-商家头像_200"];
    }
    return _posterImageView;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(160 * kMulriple, 10 * kHMulriple, 90 * kMulriple, 30 * kHMulriple)];
        _priceLabel.text = @"+145.00";
        _priceLabel.textColor = RGB(111, 111, 111);
        _priceLabel.font = [UIFont systemFontOfSize:20 * kMulriple];
    }
    return _priceLabel;
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        self.typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160 * kMulriple, 50 * kHMulriple, 100 * kMulriple, 15 * kHMulriple)];
        _typeLabel.text = @"实体店消费";
        _typeLabel.textColor = RGB(111, 111, 111);
        _typeLabel.font = [UIFont systemFontOfSize:14 * kMulriple];
    }
    return _typeLabel;
}

@end
