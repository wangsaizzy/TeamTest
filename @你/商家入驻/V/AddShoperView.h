//
//  AddShoperView.h
//  @的你
//
//  Created by 吴明飞 on 16/3/29.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddShoperView : UIView
@property (nonatomic, strong) UITextField *shopNameTF;
@property (nonatomic, strong) UITextField *contactNameTF;
@property (nonatomic, strong) UITextField *contactPhoneTF;
@property (nonatomic, strong) UITextField *detailAddressTF;
@property (nonatomic, strong) UILabel *chooseCategoryLabel;
@property (nonatomic, strong) UILabel *chooseAddressLabel;
@property (nonatomic, strong) UIButton *chooseCategoryBtn;
@property (nonatomic, strong) UIButton *chooseAddressBtn;
@property (nonatomic, strong) UIButton *addShopBtn;
@end
