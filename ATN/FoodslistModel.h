//
//  FoodslistModel.h
//  ATN
//
//  Created by 王赛 on 16/5/13.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodslistModel : NSObject


/** 美食Id */
@property (nonatomic , copy) NSString * foodId;
/** 美食所属店铺Id */
@property (nonatomic , copy) NSString * foodsForshopId;
/** 美食名字 */
@property (nonatomic , copy) NSString * foodsName;
/** 列表美食图片 */
@property (nonatomic , copy) NSString * foodListimg;
/** 美食价格 */
@property (nonatomic , copy) NSString * foodPrice;
/** 美食价格类别  美元OR 人民币 */
@property (nonatomic , copy) NSString * foodPricekind;



- (instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)foodlistDict:(NSDictionary *)dict;


@end
