//
//  FoodsTVCell.h
//  ATN
//
//  Created by 王赛 on 16/5/13.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FoodslistModel;
@interface FoodsTVCell : UITableViewCell

/** 好物图片/头像 */
@property (weak, nonatomic) IBOutlet UIImageView *foodImg;
/** 美食名字 */
@property (weak, nonatomic) IBOutlet UILabel *foodName;
/** 美食价格 */
@property (weak, nonatomic) IBOutlet UILabel *foodMoney;
/** 美元OR 人民币 */
@property (weak, nonatomic) IBOutlet UILabel *foodMoneyKind;

/** 美食模型  ---- 好物*/
@property (nonatomic , strong) FoodslistModel *foodlistmodel;
@end
