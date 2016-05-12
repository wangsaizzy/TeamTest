//
//  FinishViewCell.m
//  @你
//
//  Created by 吴明飞 on 16/4/26.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "FinishViewCell.h"

@implementation FinishViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.dayLabel];
        [self addSubview:self.weekLabel];
        [self addSubview:self.posterImageView];
        [self addSubview:self.priceLabel];
        [self addSubview:self.nameLabel];
        [self addSubview:self.timeLabel];
        
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
        _priceLabel.text = @"-145.00";
        _priceLabel.textColor = RGB(111, 111, 111);
        _priceLabel.font = [UIFont systemFontOfSize:20 * kMulriple];
    }
    return _priceLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(160 * kMulriple, 50 * kHMulriple, 230 * kMulriple, 15 * kHMulriple)];
        _nameLabel.text = @"周黑鸭(百子湾店)";
        _nameLabel.textColor = RGB(111, 111, 111);
        _nameLabel.font = [UIFont systemFontOfSize:14 * kMulriple];
    }
    return _nameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(295 * kMulriple, 10 * kHMulriple, 60 * kMulriple, 15 * kHMulriple)];
        _timeLabel.text = @"11:45";
        _timeLabel.textColor = RGB(111, 111, 111);
        _timeLabel.font = [UIFont systemFontOfSize:17 * kMulriple];
    }
    return _timeLabel;
}

@end
