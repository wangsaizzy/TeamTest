//
//  ShopInformationView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/30.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "ShopInformationView.h"
#import "UIView+Addition.h"
#import "PictureViewController.h"
@interface ShopInformationView ()<UIScrollViewDelegate>
@property (nonatomic, strong) PictureViewController *pictureVC;
@end

@implementation ShopInformationView



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        [self addSubview:self.scrollView];
        
        
        self.backgroundColor = RGB(238, 238, 238);
    }
    return self;
}

- (void)setupViews {
    
    /*
     第一个自定义View
     
     
     */
    
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 340 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    
    
    [self.shopBannerBtn addSubview:self.shopBannerImageView];
    [firstView addSubview:self.shopBannerBtn];
    
    //店铺状态
    UIView *shopStateView = [[UIView alloc] initWithFrame:CGRectMake(0, 70 * kHMulriple, kWight, 60 * kHMulriple)];
    //Label
    UILabel *shopStateTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 30 * kHMulriple)];
    shopStateTextLabel.text = @"店铺状态";
    shopStateTextLabel.textColor = RGB(111, 111, 111);
    [shopStateView addSubview:shopStateTextLabel];
    [shopStateView addSubview:self.stateSwitch];
    [shopStateView addSubview:self.shopStateLabel];
    
    [firstView addSubview:shopStateView];
    
    //头像
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 130 * kHMulriple, kWight, 90 * kHMulriple)];
    //Label
    UILabel *headTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 30 * kHMulriple, 85 * kMulriple, 30 * kHMulriple)];
    
    headTextLabel.text = @"头像";
    headTextLabel.textColor = RGB(111, 111, 111);
    [headView addSubview:headTextLabel];
    [self.headImageViewBtn addSubview:self.shopHeadImageView];
    [headView addSubview:self.headImageViewBtn];
    [firstView addSubview:headView];
    
    UILabel *lineFirstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 129 * kHMulriple, kWight, 1 * kHMulriple)];
    lineFirstLabel.backgroundColor = RGB(237, 237, 237);
    [firstView addSubview:lineFirstLabel];
    
    
    //列表展示图
    UIView *showListView = [[UIView alloc] initWithFrame:CGRectMake(0, 220 * kHMulriple, kWight, 120 * kHMulriple)];
    
    //Label
    UILabel *showListTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 95 * kMulriple, 25 * kHMulriple)];
    showListTextLabel.text = @"列表展示图";
    showListTextLabel.textColor = RGB(111, 111, 111);
    [showListView addSubview:showListTextLabel];
    [self.showListBtn addSubview:self.shopListImageView];
    [showListView addSubview:self.showListBtn];
    [firstView addSubview:showListView];
    
    
    
    
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 219 * kHMulriple, kWight, 1 * kHMulriple)];
    lineLabel.backgroundColor = RGB(237, 237, 237);
    [firstView addSubview:lineLabel];

    
    [self.scrollView addSubview:firstView];
    /*
     第二个自定义View
     
     
     */
    
    self.secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 345 * kHMulriple, kWight,  140* kHMulriple)];
    _secondView.backgroundColor = [UIColor whiteColor];
    
    
    
    //Label
    UILabel *showEnvironmentTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 95 * kMulriple, 30 * kHMulriple)];
    showEnvironmentTextLabel.text = @"环境展示图";
    showEnvironmentTextLabel.textColor = RGB(111, 111, 111);
    [_secondView addSubview:showEnvironmentTextLabel];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * kMulriple, 20 * kHMulriple, 85 * kMulriple, 20 * kHMulriple)];
    numberLabel.text = @"(最多二十张)";
    numberLabel.font = [UIFont systemFontOfSize:12 * kMulriple];
    numberLabel.textColor = RGB(111, 111, 111);
    [_secondView addSubview:numberLabel];
    [self.scrollView addSubview:self.secondView];
    
    /*
     第三个自定义View
     
     
     */
    
    
    self.thirdView = [[UIView alloc] initWithFrame:CGRectMake(0, 500 * kHMulriple, kWight,  180* kHMulriple)];
    _thirdView.backgroundColor = [UIColor whiteColor];

    
    //店铺名称
    UIView *shopNameView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 60 * kHMulriple)];
    //Label
    UILabel *shopNameTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 30 * kHMulriple)];

    shopNameTextLabel.text = @"店铺名称";
    shopNameTextLabel.textColor = RGB(111, 111, 111);
    [shopNameView addSubview:shopNameTextLabel];
    [shopNameView addSubview:self.shopNameTF];
    [_thirdView addSubview:shopNameView];
    
    
    
    //店铺区域
    UIView *shopAddressView = [[UIView alloc] initWithFrame:CGRectMake(0, 60 * kHMulriple, kWight, 60 * kHMulriple)];
    //Label
    UILabel *shopAddressTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 105 * kMulriple, 30 * kHMulriple)];
    UIImageView *shopAddressImage = [[UIImageView alloc] initWithFrame:CGRectMake(180 * kMulriple, 10 * kHMulriple, 15 * kMulriple, 10 * kHMulriple)];
    [shopAddressImage setImage:[UIImage imageNamed:@"arrow"]];
    shopAddressImage.centerY = self.chooseAddressBtn.height / 2;
    [self.chooseAddressBtn addSubview:shopAddressImage];
    shopAddressTextLabel.text = @"店铺区域";
    shopAddressTextLabel.textColor = RGB(111, 111, 111);
    [shopAddressView addSubview:shopAddressTextLabel];
    [shopAddressView addSubview:self.chooseAddressBtn];
    //self.chooseAddressBtn.centerY = shopAddressView.height / 2;
    [self.chooseAddressBtn addSubview:self.chooseAddressLabel];
    [_thirdView addSubview:shopAddressView];
    
    
    //店铺地址
    UIView *detailAddressView = [[UIView alloc] initWithFrame:CGRectMake(0, 120 * kHMulriple, kWight, 60 * kHMulriple)];
    //Label
    UILabel *detailAddressTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 105 * kMulriple, 30 * kHMulriple)];
    detailAddressTextLabel.text = @"店铺地址";
    detailAddressTextLabel.textColor = RGB(111, 111, 111);
    
    [detailAddressView addSubview:detailAddressTextLabel];
    
    [detailAddressView addSubview:self.detailAddressTF];
    [_thirdView addSubview:detailAddressView];
    
    
    for (int i = 0; i < 2; i++) {
        //分割线
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 59 * kHMulriple + i * 59 * kHMulriple, kWight, 1 * kHMulriple)];
        lineLabel.backgroundColor = RGB(237, 237, 237);
        [_thirdView addSubview:lineLabel];
    }
    
    [self.scrollView addSubview:self.thirdView];
    
    /*
     第四个自定义View
     
     
     */
    
    
    self.fouthView = [[UIView alloc] initWithFrame:CGRectMake(0, 695 * kHMulriple, kWight,  220 * kHMulriple)];
    _fouthView.backgroundColor = [UIColor whiteColor];
    
    
    //店铺分类
    UIView *shopCategoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 60 * kHMulriple)];
    //Label
    UILabel *shopCategoryTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 30 * kHMulriple)];
    
    shopCategoryTextLabel.text = @"店铺分类";
    shopCategoryTextLabel.textColor = RGB(111, 111, 111);
    [shopCategoryView addSubview:shopCategoryTextLabel];
    
    UIImageView *shopCategoryImage = [[UIImageView alloc] initWithFrame:CGRectMake(180 * kMulriple, 10 * kHMulriple, 15 * kMulriple, 10 * kHMulriple)];
    [shopCategoryImage setImage:[UIImage imageNamed:@"arrow"]];
    shopCategoryImage.centerY = self.chooseCategoryBtn.height / 2;
    [shopCategoryView addSubview:self.chooseCategoryBtn];
    [self.chooseCategoryBtn addSubview:self.chooseCategoryLabel];
    [_fouthView addSubview:shopCategoryView];
    
    
    
    //电话
    UIView *shopPhoneView = [[UIView alloc] initWithFrame:CGRectMake(0, 60 * kHMulriple, kWight, 60 * kHMulriple)];
    //Label
    UILabel *showPhoneTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 105 * kMulriple, 30 * kHMulriple)];
    
    showPhoneTextLabel.text = @"电话";
    showPhoneTextLabel.textColor = RGB(111, 111, 111);
    [shopPhoneView addSubview:showPhoneTextLabel];
    [shopPhoneView addSubview:self.phoneTF];
    [_fouthView addSubview:shopPhoneView];
    
    
    //折扣说明
    UIView *explainDiscountView = [[UIView alloc] initWithFrame:CGRectMake(0, 120 * kHMulriple, kWight, 50 * kHMulriple)];
    //Label
    UILabel *explainDiscountTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 105 * kMulriple, 20 * kHMulriple)];
    explainDiscountTextLabel.text = @"折扣说明";
    explainDiscountTextLabel.textColor = RGB(111, 111, 111);
    [explainDiscountView addSubview:explainDiscountTextLabel];
    [explainDiscountView addSubview:self.discountTF];
    [_fouthView addSubview:explainDiscountView];
    
    
    for (int i = 0; i < 2; i++) {
        //分割线
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 59 * kHMulriple + i * 59 * kHMulriple, kWight, 1 * kHMulriple)];
        lineLabel.backgroundColor = RGB(237, 237, 237);
        [_fouthView addSubview:lineLabel];
    }
    
    [self.scrollView addSubview:self.fouthView];
    
    UILabel *lineTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 169 * kHMulriple, kWight, 1 * kHMulriple)];
    lineTextLabel.backgroundColor = RGB(237, 237, 237);
    [_fouthView addSubview:lineTextLabel];
    
    //提示内容
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 180 * kHMulriple, 335 * kMulriple, 30 * kHMulriple)];
   
    textLabel.text = @"更改店名、地址、电话等内容请联系业务经理!";
    textLabel.font = [UIFont systemFontOfSize:14 * kMulriple];
    textLabel.textColor = RGB(111, 111, 111);
    [_fouthView addSubview:textLabel];

}

#pragma mark -懒加载
//滑动视图
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWight, kHeight)];
        self.scrollView.contentSize = CGSizeMake(kWight, 930 * kHMulriple);
        self.scrollView.backgroundColor = RGB(238, 238, 238);
        self.scrollView.delegate = self;
        self.scrollView.showsVerticalScrollIndicator = NO;//纵向滚动条
        self.scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

//横幅按钮
- (UIButton *)shopBannerBtn {
    if (!_shopBannerBtn) {
        self.shopBannerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _shopBannerBtn.frame = CGRectMake(0, 0, kWight, 70 * kHMulriple);
    }
    return _shopBannerBtn;
}

//横幅
- (UIImageView *)shopBannerImageView {
    if (!_shopBannerImageView) {
        self.shopBannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWight, 70 * kHMulriple)];
        _shopBannerImageView.backgroundColor = [UIColor orangeColor];
        
    }
    return _shopBannerImageView;
}

//开关
- (UISwitch *)stateSwitch {
    if (!_stateSwitch) {
        self.stateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(275 * kMulriple, 15 * kHMulriple, 90 * kMulriple, 45 * kHMulriple)];
        self.stateSwitch.on = YES;
        // 控件大小，不能设置frame，只能用缩放比例
        self.stateSwitch.onTintColor = RGB(235, 88, 64);
    }
    return _stateSwitch;
}

//展示店铺状态Label
- (UILabel *)shopStateLabel {
    if (!_shopStateLabel) {
        self.shopStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(135 * kMulriple, 15 * kHMulriple, 80 * kMulriple, 30 * kHMulriple)];
        self.shopStateLabel.text = @"营业中";
        self.shopStateLabel.textColor = RGB(77, 77, 77);
    }
    return _shopStateLabel;
}

//头像按钮
- (UIButton *)headImageViewBtn {
    if (!_headImageViewBtn) {
        self.headImageViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(147 * kMulriple, 10 * kHMulriple, 70 * kMulriple, 70 * kHMulriple)];
        
    }
    return _headImageViewBtn;
}

//头像
- (UIImageView *)shopHeadImageView {
    if (!_shopHeadImageView) {
        self.shopHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70 * kMulriple, 70 * kHMulriple)];
        self.shopHeadImageView.image = [UIImage imageNamed:@"2商家-添加图片_圆1"];
        self.shopHeadImageView.layer.masksToBounds = YES;
        self.shopHeadImageView.layer.cornerRadius = 35 * kMulriple;
    }
    return _shopHeadImageView;
}

//店铺名称输入框
- (UITextField *)shopNameTF {
    if (!_shopNameTF) {
        self.shopNameTF = [[UITextField alloc] initWithFrame:CGRectMake(135 * kMulriple, 7.5 * kHMulriple, 220 * kMulriple, 45 * kHMulriple)];
        self.shopNameTF.text = @" 周黑鸭-百子湾店";
        self.shopNameTF.textColor = RGB(111, 111, 111);
        self.shopNameTF.backgroundColor = RGB(238, 238, 238);
    }
    return _shopNameTF;
}


//选择店铺种类按钮
- (UIButton *)chooseCategoryBtn {
    if (!_chooseCategoryBtn) {
        self.chooseCategoryBtn = [[UIButton alloc] initWithFrame:CGRectMake(135 * kMulriple, 5 * kHMulriple, 220 * kMulriple, 45 * kHMulriple)];
        [self.chooseCategoryBtn.layer setBorderWidth:1 * kMulriple];   //边框宽度
        [self.chooseCategoryBtn.layer setBorderColor:RGB(237, 237, 237).CGColor];//边框颜色
    }
    return _chooseCategoryBtn;
}

//选择店铺种类label
- (UILabel *)chooseCategoryLabel {
    if (!_chooseCategoryLabel) {
        self.chooseCategoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * kMulriple, 5 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
        self.chooseCategoryLabel.text = @"美食-火锅";
        self.chooseCategoryLabel.centerY = self.chooseCategoryBtn.height / 2;
        self.chooseCategoryLabel.textColor = RGB(111, 111, 111);
    }
    return _chooseCategoryLabel;
}

//选择店铺区域按钮
- (UIButton *)chooseAddressBtn {
    if (!_chooseAddressBtn) {
        
        self.chooseAddressBtn = [[UIButton alloc] initWithFrame:CGRectMake(135 * kMulriple, 5 * kHMulriple, 220 * kMulriple, 45 * kHMulriple)];
        [self.chooseAddressBtn.layer setBorderWidth:1 * kMulriple];   //边框宽度
        [self.chooseAddressBtn.layer setBorderColor:RGB(237, 237, 237).CGColor];//边框颜色
    }
    return _chooseAddressBtn;
}

//选择店铺种类Label
- (UILabel *)chooseAddressLabel {
    if (!_chooseAddressLabel) {
        self.chooseAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * kMulriple, 5 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
        self.chooseAddressLabel.text = @"北京-西城区";
        self.chooseAddressLabel.centerY = self.chooseAddressBtn.height / 2;
        self.chooseAddressLabel.textColor = RGB(111, 111, 111);
    }
    return _chooseAddressLabel;
}

//店铺详细地址输入框
- (UITextField *)detailAddressTF {
    if (!_detailAddressTF) {
        self.detailAddressTF = self.shopNameTF = [[UITextField alloc] initWithFrame:CGRectMake(135 * kMulriple, 7.5 * kHMulriple, 220 * kMulriple, 45 * kHMulriple)];
        self.detailAddressTF.text = @"  东四北大街35号";
        self.detailAddressTF.textColor = RGB(111, 111, 111);
        
    }
    return _detailAddressTF;
}

//电话输入框
- (UITextField *)phoneTF {
    if (!_phoneTF) {
        self.phoneTF = [[UITextField alloc] initWithFrame:CGRectMake(135 * kMulriple, 7.5 * kHMulriple, 220 * kMulriple, 45 * kHMulriple)];
        self.phoneTF.text = @" 010 6666 8888";
        self.phoneTF.textColor = RGB(111, 111, 111);
        self.phoneTF.backgroundColor = RGB(238, 238, 238);
    }
    return _phoneTF;
}

//折扣输入框
- (UITextField *)discountTF {
    if (!_discountTF) {
        self.discountTF = [[UITextField alloc] initWithFrame:CGRectMake(135 * kMulriple, 7.5 * kHMulriple, 220 * kMulriple, 35 * kHMulriple)];
        self.discountTF.text = @"  20%返现";
        self.discountTF.textColor = RGB(111, 111, 111);
        self.discountTF.backgroundColor = RGB(238, 238, 238);
    }
    return _discountTF;
}

//列表展示图
- (UIImageView *)shopListImageView {
    if (!_shopListImageView) {
        self.shopListImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80 * kMulriple, 80 * kHMulriple)];
        _shopListImageView.image = [UIImage imageNamed:@"2商家-添加图片_大1"];
    }
    return _shopListImageView;
}

//列表展示图按钮
- (UIButton *)showListBtn {
    if (!_showListBtn) {
        self.showListBtn = [[UIButton alloc] initWithFrame:CGRectMake(135 * kMulriple, 20 * kHMulriple, 80 * kMulriple, 80 * kHMulriple)];
    }
    return _showListBtn;
}



@end
