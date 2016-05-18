//
//  ManagerProductCell.m
//  @的你
//
//  Created by 吴明飞 on 16/3/31.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "ManagerProductCell.h"

@implementation ManagerProductCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.productImage];
        [self addSubview:self.productNameLabel];
        [self addSubview:self.productPriceLabel];
        [self addSubview:self.editBtn];
        [self addSubview:self.deleteBtn];
        [self addSubview:self.productStockBtn];
        [self addSubview:self.productResumeBtn];
        
        self.categoryBtnArr = [[NSMutableArray alloc] initWithCapacity:6];
        [self.categoryBtnArr addObject:self.productResumeBtn];
        [self.categoryBtnArr addObject:self.productStockBtn];
    }
    return self;
}

#pragma mark -懒加载
//商品图片
- (UIImageView *)productImage {
    if (!_productImage) {
        self.productImage = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 90 * kMulriple, 80 * kHMulriple)];
        self.productImage.backgroundColor = [UIColor purpleColor];
    }
    return _productImage;
}

//商品名称
- (UILabel *)productNameLabel {
    if (!_productNameLabel) {
        self.productNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(125 * kMulriple, 15 * kHMulriple, 220 * kMulriple, 25 * kHMulriple)];
    }
    return _productNameLabel;
}

//商品价格
- (UILabel *)productPriceLabel {
    if (!_productPriceLabel) {
        self.productPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(125 * kMulriple, 50 * kHMulriple, 220 * kMulriple, 25 * kHMulriple)];
    }
    return _productPriceLabel;
}

//编辑按钮
- (UIButton *)editBtn {
    if (!_editBtn) {
        self.editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _editBtn.frame = CGRectMake(325 * kMulriple, 45 * kHMulriple, 25 * kMulriple, 25 * kMulriple);
        [_editBtn setImage:[UIImage imageNamed:@"2商家-编辑商品"] forState:UIControlStateNormal];
    }
    return _editBtn;
}

//删除按钮
- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        self.deleteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _deleteBtn.frame = CGRectMake(185 * kMulriple, 95 * kHMulriple, 80 * kMulriple, 30 * kMulriple);
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBtn.layer setBorderWidth:1 * kMulriple];   //边框宽度
        [_deleteBtn.layer setBorderColor:RGB(237, 237, 237).CGColor];//边框颜色
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:17 * kMulriple];
        [_deleteBtn setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];

    }
    return _deleteBtn;
}

//产品状态按钮
- (UIButton *)productStockBtn {
    if (!_productStockBtn) {
        self.productStockBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _productStockBtn.frame = CGRectMake(280 * kMulriple, 95 * kHMulriple, 80 * kMulriple, 30 * kMulriple);
        [_productStockBtn setTitle:@"缺货下架" forState:UIControlStateNormal];
        [_productStockBtn.layer setBorderWidth:1 * kMulriple];   //边框宽度
        [_productStockBtn.layer setBorderColor:RGB(237, 237, 237).CGColor];//边框颜色
        _productStockBtn.titleLabel.font = [UIFont systemFontOfSize:17 * kMulriple];
        [_productStockBtn setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
    }
    return _productStockBtn;
}

- (UIButton *)productResumeBtn {
    if (!_productResumeBtn) {
        self.productResumeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _productResumeBtn.frame = CGRectMake(280 * kMulriple, 95 * kHMulriple, 80 * kMulriple, 30 * kMulriple);
        [_productResumeBtn setTitle:@"恢复售卖" forState:UIControlStateNormal];
        _productResumeBtn.backgroundColor = [UIColor redColor];
        _productResumeBtn.titleLabel.font = [UIFont systemFontOfSize:17 * kMulriple];
        [_productResumeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _productResumeBtn;
}


@end
