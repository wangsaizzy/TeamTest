//
//  FoodslistModel.m
//  ATN
//
//  Created by 王赛 on 16/5/13.
//  Copyright © 2016年 王赛. All rights reserved.
//
//
///** 美食Id */
//@property (nonatomic , copy) NSString * foodId;
///** 美食所属店铺Id */
//@property (nonatomic , copy) NSString * foodsForshopId;
///** 美食名字 */
//@property (nonatomic , copy) NSString * foodsName;
///** 列表美食图片 */
//@property (nonatomic , copy) NSString * foodListimg;
///** 美食价格 */
//@property (nonatomic , copy) NSString * foodPrice;



#import "FoodslistModel.h"

@implementation FoodslistModel

-(instancetype) initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)foodlistDict:(NSDictionary *)dict
{
    FoodslistModel *foodsInfo = [[FoodslistModel alloc]init];
    
    foodsInfo.foodId = dict[@"foodId"];
    foodsInfo.foodsForshopId = dict[@"foodsForshopId"];
    foodsInfo.foodsName = dict[@"foodsName"];
    foodsInfo.foodListimg = dict[@"foodListimg"];
    foodsInfo.foodPrice = dict[@"foodPrice"];
    foodsInfo.foodPricekind = dict[@"foodPricekind"];
    
    return foodsInfo;

}


@end
