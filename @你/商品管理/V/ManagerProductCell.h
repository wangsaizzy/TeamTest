//
//  ManagerProductCell.h
//  @的你
//
//  Created by 吴明飞 on 16/3/31.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerProductCell : UITableViewCell
@property (nonatomic, strong) UIImageView *productImage;
@property (nonatomic, strong) UILabel *productNameLabel;
@property (nonatomic, strong) UILabel *productPriceLabel;
@property (nonatomic, strong) UIButton *editBtn;
@property (nonatomic, strong) UIButton *deleteBtn;
@property (nonatomic, strong) UIButton *productResumeBtn;
@property (nonatomic, strong) UIButton *productStockBtn;

@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, strong) NSMutableArray *categoryBtnArr;
@end
