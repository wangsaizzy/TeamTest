//
//  AddShoperView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/29.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "AddShoperView.h"

@implementation AddShoperView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        [self addSubview:self.addShopBtn];
        self.backgroundColor = RGB(238, 238, 238);
    }
    return self;
}

- (void)setupViews {
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 5 * kHMulriple, 335 * kMulriple, 30 * kHMulriple)];
    textLabel.numberOfLines = 0;
    textLabel.text = @"感谢您的加盟，请填写以下基本资料，我们会尽快安排销售经理与您联系!";
    textLabel.font = [UIFont systemFontOfSize:12 * kMulriple];
    textLabel.textColor = RGB(111, 111, 111);
    [self addSubview:textLabel];
    
    /*
     自定义View
     
     
     */
    
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 40 * kHMulriple, kWight, 360 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    
    
    
    
    //店铺名称
    UIView *shopNameView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWight, 60 * kHMulriple)];
    //Label
    UILabel *shopNameTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 30 * kHMulriple)];
    shopNameTextLabel.text = @"店铺名称";
    shopNameTextLabel.textColor = RGB(111, 111, 111);
    [shopNameView addSubview:shopNameTextLabel];
    [shopNameView addSubview:self.shopNameTF];
    [firstView addSubview:shopNameView];
   
    
    //联系人姓名
    UIView *contactNameView = [[UIView alloc] initWithFrame:CGRectMake(0, 60 * kHMulriple, kWight, 60 * kHMulriple)];

    //Label
    UILabel *contactNameTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 95 * kMulriple, 30 * kHMulriple)];
    contactNameTextLabel.text = @"联系人姓名";
    contactNameTextLabel.textColor = RGB(111, 111, 111);
    [contactNameView addSubview:contactNameTextLabel];
    [contactNameView addSubview:self.contactNameTF];
    [firstView addSubview:contactNameView];
    
    
    //联系人电话
    UIView *contactPhoneView = [[UIView alloc] initWithFrame:CGRectMake(0, 120 * kHMulriple, kWight, 60 * kHMulriple)];

    //Label
    UILabel *contactPhoneTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 95 * kMulriple, 30 * kHMulriple)];
    contactPhoneTextLabel.text = @"联系人电话";
    contactPhoneTextLabel.textColor = RGB(111, 111, 111);
    [contactPhoneView addSubview:self.contactPhoneTF];
    [contactPhoneView addSubview:contactPhoneTextLabel];
    [firstView addSubview:contactPhoneView];
    
    
    
    for (int i = 0; i < 6; i++) {
        //分割线
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, i * 59 * kHMulriple, kWight, 1 * kHMulriple)];
        lineLabel.backgroundColor = RGB(237, 237, 237);
        [firstView addSubview:lineLabel];
    }
    
    
    
    //店铺类别
    UIView *shopCategoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 180 * kHMulriple, kWight, 60 * kHMulriple)];
    //Label
    UILabel *shopCategoryTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 30 * kHMulriple)];
    
    UIImageView *shopCategoryImage = [[UIImageView alloc] initWithFrame:CGRectMake(180 * kMulriple, 10 * kHMulriple, 15 * kMulriple, 10 * kHMulriple)];
    [shopCategoryImage setImage:[UIImage imageNamed:@"arrow"]];
    shopCategoryImage.centerY = self.chooseCategoryBtn.height / 2;
    [self.chooseCategoryBtn addSubview:shopCategoryImage];
    shopCategoryTextLabel.text = @"商铺类别";
    shopCategoryTextLabel.textColor = RGB(111, 111, 111);
    [shopCategoryView addSubview:shopCategoryTextLabel];
    [shopCategoryView addSubview:self.chooseCategoryBtn];
    [self.chooseCategoryBtn addSubview:self.chooseCategoryLabel];
    [firstView addSubview:shopCategoryView];
    
    
    
    //店铺所在区域
    UIView *shopAddressView = [[UIView alloc] initWithFrame:CGRectMake(0, 240 * kHMulriple, kWight, 60 * kHMulriple)];
    //Label
    UILabel *shopAddressTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 105 * kMulriple, 30 * kHMulriple)];
    UIImageView *shopAddressImage = [[UIImageView alloc] initWithFrame:CGRectMake(180 * kMulriple, 10 * kHMulriple, 15 * kMulriple, 10 * kHMulriple)];
    [shopAddressImage setImage:[UIImage imageNamed:@"arrow"]];
    shopAddressImage.centerY = self.chooseAddressBtn.height / 2;
    [self.chooseAddressBtn addSubview:shopAddressImage];
    shopAddressTextLabel.text = @"商家所在区域";
    shopAddressTextLabel.textColor = RGB(111, 111, 111);
    [shopAddressView addSubview:shopAddressTextLabel];
    [shopAddressView addSubview:self.chooseAddressBtn];
    //self.chooseAddressBtn.centerY = shopAddressView.height / 2;
    [self.chooseAddressBtn addSubview:self.chooseAddressLabel];
    [firstView addSubview:shopAddressView];
    
   
    //店铺详细地址
    UIView *detailAddressView = [[UIView alloc] initWithFrame:CGRectMake(0, 300 * kHMulriple, kWight, 60 * kHMulriple)];
    //Label
    UILabel *detailAddressTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 105 * kMulriple, 30 * kHMulriple)];
    detailAddressTextLabel.text = @"店铺详细地址";
    detailAddressTextLabel.textColor = RGB(111, 111, 111);
    [detailAddressView addSubview:detailAddressTextLabel];
    [detailAddressView addSubview:self.detailAddressTF];
    [firstView addSubview:detailAddressView];
    
    [self addSubview:firstView];
}


#pragma mark -懒加载
//店铺名称输入框
- (UITextField *)shopNameTF {
    if (!_shopNameTF) {
        self.shopNameTF = [[UITextField alloc] initWithFrame:CGRectMake(145 * kMulriple, 7.5 * kHMulriple, 210 * kMulriple, 45 * kHMulriple)];
        self.shopNameTF.backgroundColor = RGB(238, 238, 238);
    }
    return _shopNameTF;
}

//联系人姓名输入框
- (UITextField *)contactNameTF {
    if (!_contactNameTF) {
        self.contactNameTF = [[UITextField alloc] initWithFrame:CGRectMake(145 * kMulriple, 7.5 * kHMulriple, 210 * kMulriple, 45 * kHMulriple)];
        self.contactNameTF.backgroundColor = RGB(238, 238, 238);
    }
    return _contactNameTF;
}

//联系人电话输入框
- (UITextField *)contactPhoneTF {
    if (!_contactPhoneTF) {
        self.contactPhoneTF = [[UITextField alloc] initWithFrame:CGRectMake(145 * kMulriple, 7.5 * kHMulriple, 210 * kMulriple, 45 * kHMulriple)];
        self.contactPhoneTF.backgroundColor = RGB(238, 238, 238);
    }
    return _contactPhoneTF;
}

//选择店铺种类按钮
- (UIButton *)chooseCategoryBtn {
    if (!_chooseCategoryBtn) {
        self.chooseCategoryBtn = [[UIButton alloc] initWithFrame:CGRectMake(145 * kMulriple, 5 * kHMulriple, 210 * kMulriple, 45 * kHMulriple)];
        [self.chooseCategoryBtn.layer setBorderWidth:1 * kMulriple];   //边框宽度
        [self.chooseCategoryBtn.layer setBorderColor:RGB(237, 237, 237).CGColor];//边框颜色
    }
    return _chooseCategoryBtn;
}

//选择店铺种类label
- (UILabel *)chooseCategoryLabel {
    if (!_chooseCategoryLabel) {
        self.chooseCategoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * kMulriple, 5 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
        self.chooseCategoryLabel.text = @"请选择店铺种类";
        self.chooseCategoryLabel.centerY = self.chooseCategoryBtn.height / 2;
        self.chooseCategoryLabel.textColor = RGB(111, 111, 111);
    }
    return _chooseCategoryLabel;
}

//选择店铺区域按钮
- (UIButton *)chooseAddressBtn {
    if (!_chooseAddressBtn) {
        
        self.chooseAddressBtn = [[UIButton alloc] initWithFrame:CGRectMake(145 * kMulriple, 5 * kHMulriple, 210 * kMulriple, 45 * kHMulriple)];
        [self.chooseAddressBtn.layer setBorderWidth:1 * kMulriple];   //边框宽度
        [self.chooseAddressBtn.layer setBorderColor:RGB(237, 237, 237).CGColor];//边框颜色
    }
    return _chooseAddressBtn;
}

//选择店铺种类Label
- (UILabel *)chooseAddressLabel {
    if (!_chooseAddressLabel) {
        self.chooseAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * kMulriple, 5 * kHMulriple, 125 * kMulriple, 25 * kHMulriple)];
        self.chooseAddressLabel.text = @"请选择店铺区域";
        self.chooseAddressLabel.textColor = RGB(111, 111, 111);
    }
    return _chooseAddressLabel;
}

//店铺详细地址输入框
- (UITextField *)detailAddressTF {
    if (!_detailAddressTF) {
        self.detailAddressTF = self.shopNameTF = [[UITextField alloc] initWithFrame:CGRectMake(145 * kMulriple, 7.5 * kHMulriple, 210 * kMulriple, 45 * kHMulriple)];
        self.detailAddressTF.placeholder = @"  请输入店铺详细地址";
        self.detailAddressTF.textColor = RGB(111, 111, 111);
        self.detailAddressTF.backgroundColor = RGB(238, 238, 238);
        
    }
    return _detailAddressTF;
}

- (UIButton *)addShopBtn {
    if (!_addShopBtn) {
        self.addShopBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.addShopBtn.frame = CGRectMake(20 * kMulriple, 420 * kHMulriple, 335 * kMulriple, 50 * kHMulriple);
        [self.addShopBtn setTitle:@"我 要 入 驻" forState:UIControlStateNormal];
        [self.addShopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.addShopBtn.titleLabel.font = [UIFont systemFontOfSize:18 * kMulriple];
        self.addShopBtn.backgroundColor = RGB(255, 84, 66);
        self.addShopBtn.layer.cornerRadius = 25 * kMulriple;
        self.addShopBtn.layer.masksToBounds = YES;
    }
    return _addShopBtn;
}
@end
