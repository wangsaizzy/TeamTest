//
//  ShopTVCell.m
//  @你
//
//  Created by 王赛 on 16/4/26.
//  Copyright © 2016年 王赛. All rights reserved.
//
///** 店铺头像 */
//@property (weak, nonatomic) IBOutlet UIImageView *shopImg;
///** 店铺名字 （拼接地址） */
//@property (weak, nonatomic) IBOutlet UILabel *shopName;
///** 店铺类型   美食-蛋糕 */
//@property (weak, nonatomic) IBOutlet UILabel *shopKind;
///** 店铺地址 */
//@property (weak, nonatomic) IBOutlet UILabel *shopAdress;
///** 店铺返现额度   30% */
//@property (weak, nonatomic) IBOutlet UILabel *backMoney;
//

#import "ShopTVCell.h"

#import "ShoplistModel.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
@implementation ShopTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setShoplistmodel:(ShoplistModel *)shoplistmodel{

    _shoplistmodel = shoplistmodel;
    
    _shopImg.image = [UIImage imageNamed:shoplistmodel.shopListimg];
    
    _shopName.text = shoplistmodel.shopListName;
    
    _shopKind.text = shoplistmodel.kindName;
    
    _shopAdress.text = shoplistmodel.cityName;
    
    _backMoney.text = shoplistmodel.backMoney;
    
    if ([shoplistmodel.isReserve isEqualToString:@"0"]) {
        _reserve.image = [UIImage imageNamed:@"reserve"];
        
    }else{
        
        _reserve.hidden = YES;
    }
    

    

    
    
}

//-(void)setShoplistmodel:(ShoplistModel *)shoplistmodel
//{
//    if (!shoplistmodel) {
//        return;
//    }
//    if (!shoplistmodel.shopName) {
//        return;
//    }
//}


@end
