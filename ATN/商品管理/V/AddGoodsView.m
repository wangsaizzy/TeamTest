//
//  AddGoodsView.m
//  ATN
//
//  Created by 吴明飞 on 16/5/7.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "AddGoodsView.h"

@implementation AddGoodsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupViews];
        self.backgroundColor = RGB(238, 238, 238);
    }
    return self;
}

- (void)setupViews {
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 100 * kMulriple)];
    contentView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:self.goodsImageBtn];
    [self.goodsImageBtn addSubview:self.goodsImageView];
    [contentView addSubview:self.goodsNameTF];
    [contentView addSubview:self.goodsPriceTF];
    
    [self addSubview:contentView];
}

//懒加载


//商品图片
- (UIImageView *)goodsImageView {
    if (!_goodsImageView) {
        self.goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90 * kMulriple, 80 * kHMulriple)];
        _goodsImageView.image = [UIImage imageNamed:@"2商家-添加图片_大1"];
    }
    return _goodsImageView;
}

//商品名称
- (UITextField *)goodsNameTF {
    if (!_goodsNameTF) {
        self.goodsNameTF = [[UITextField alloc] initWithFrame:CGRectMake(115 * kMulriple, 30 * kHMulriple, 160 * kMulriple, 40 * kHMulriple)];
        _goodsNameTF.placeholder = @"请输入商品名称";
        _goodsNameTF.textColor = RGB(111, 111, 111);
        _goodsNameTF.backgroundColor = RGB(238, 238, 238);
    }
    return _goodsNameTF;
}

//商品价格
- (UITextField *)goodsPriceTF {
    if (!_goodsPriceTF) {
        self.goodsPriceTF = [[UITextField alloc] initWithFrame:CGRectMake(285 * kMulriple, 30 * kHMulriple, 80 * kMulriple, 40 * kHMulriple)];
        _goodsPriceTF.placeholder = @"填写价格";
        _goodsPriceTF.textColor = RGB(111, 111, 111);
        _goodsPriceTF.backgroundColor = RGB(238, 238, 238);
    }
    return _goodsPriceTF;
}

//商品图片添加按钮
- (UIButton *)goodsImageBtn {
    if (!_goodsImageBtn) {
        self.goodsImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(15 * kMulriple, 10 * kHMulriple, 90 * kMulriple, 80 * kHMulriple)];
    }
    return _goodsImageBtn;
}


@end
