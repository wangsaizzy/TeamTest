//
//  FoodsTVCell.m
//  ATN
//
//  Created by 王赛 on 16/5/13.
//  Copyright © 2016年 王赛. All rights reserved.
//

///** 好物图片/头像 */
//@property (weak, nonatomic) IBOutlet UIImageView *foodImg;
///** 美食名字 */
//@property (weak, nonatomic) IBOutlet UILabel *foodName;
///** 美食价格 */
//@property (weak, nonatomic) IBOutlet UILabel *foodMoney;
///** 美元OR 人民币 */
//@property (weak, nonatomic) IBOutlet UILabel *foodMoneyKind;

#import "FoodsTVCell.h"

#import "FoodslistModel.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@implementation FoodsTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFoodlistmodel:(FoodslistModel *)foodlistmodel{

    _foodlistmodel = foodlistmodel;
    
    _foodImg.image = [UIImage imageNamed:foodlistmodel.foodListimg];
    
    _foodName.text = foodlistmodel.foodsName;
    
    _foodMoney.text = foodlistmodel.foodPrice;
    
//    _foodMoneyKind.text = foodlistmodel.foodPricekind;

    
}

@end
