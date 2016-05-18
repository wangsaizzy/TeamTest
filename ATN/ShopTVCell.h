//
//  ShopTVCell.h
//  ATN
//
//  Created by 王赛 on 16/4/26.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShoplistModel;
@interface ShopTVCell : UITableViewCell
/** 店铺头像 */
@property (weak, nonatomic) IBOutlet UIImageView *shopImg;
/** 店铺名字 （拼接地址） */
@property (weak, nonatomic) IBOutlet UILabel *shopName;
/** 店铺类型   美食-蛋糕 */
@property (weak, nonatomic) IBOutlet UILabel *shopKind;
/** 店铺地址 */
@property (weak, nonatomic) IBOutlet UILabel *shopAdress;
/** 店铺返现额度   30% */
@property (weak, nonatomic) IBOutlet UILabel *backMoney;
/**  预约 */
@property (weak, nonatomic) IBOutlet UIImageView *reserve;

/** 首页商铺模型 */
@property (nonatomic , strong) ShoplistModel * shoplistmodel;
@end
