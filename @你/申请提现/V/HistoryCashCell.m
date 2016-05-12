//
//  HistoryCashCell.m
//  @你
//
//  Created by 吴明飞 on 16/4/28.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "HistoryCashCell.h"

@implementation HistoryCashCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.cashLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.statusLabel];
        
    }
    return self;
}

//提现金额
- (UILabel *)cashLabel {
    if (!_cashLabel) {
        self.cashLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 32.5 * kHMulriple, 160 * kMulriple, 25 * kHMulriple)];
        _cashLabel.text = @"￥1233.40";
        _cashLabel.textColor = [UIColor redColor];
    }
    return _cashLabel;
}

//时间
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        self.timeLabel = self.cashLabel = [[UILabel alloc] initWithFrame:CGRectMake(180 * kMulriple, 15 * kHMulriple, 175 * kMulriple, 25 * kHMulriple)];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.text = @"2016-4-28 11:58:59";
        _timeLabel.textColor = RGB(111, 111, 111);

    }
    return _timeLabel;
}

//状态
- (UILabel *)statusLabel {
    if (!_statusLabel) {
        self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(180 * kMulriple, 45 * kHMulriple, 175 * kMulriple, 25 * kHMulriple)];
        _statusLabel.textAlignment = NSTextAlignmentRight;
        _statusLabel.text = @"(审核通过，已打款)";
        _statusLabel.textColor = [UIColor redColor];
    }
    return _statusLabel;
}

@end
