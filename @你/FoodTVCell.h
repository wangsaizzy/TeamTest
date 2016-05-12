//
//  FoodTVCell.h
//  @你
//
//  Created by 王赛 on 16/4/14.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTVCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImg;//商铺头像
@property (weak, nonatomic) IBOutlet UILabel *nameTitle;//商铺名字
@property (weak, nonatomic) IBOutlet UILabel *kindTitle;//商铺类型

@property (weak, nonatomic) IBOutlet UIImageView *yuyueImg;//是否需要预约
@property (weak, nonatomic) IBOutlet UILabel *locationTitle;//店铺地址
@property (weak, nonatomic) IBOutlet UILabel *returnMoney;//返现额度
@end
