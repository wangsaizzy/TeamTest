//
//  ShoplistModel.m
//  ATN
//
//  Created by 王赛 on 16/4/25.
//  Copyright © 2016年 王赛. All rights reserved.
//
///*
///** 店铺Id */
//@property (nonatomic , copy) NSString * shopId;
///** 店铺图片URL地址字符串 */
//@property (nonatomic , copy) NSString * shopimgUrl;
///**  店铺返现额度 */
//@property (nonatomic , copy) NSNumber * backMoney;
///** 店铺城市地址 */
//@property (nonatomic , copy) NSString * cityName;
///** 店铺详细地址 */
//@property (nonatomic , copy) NSString * addressName;
///** 店铺类型 */
//@property (nonatomic , copy) NSString * kindName;
///** 店铺头像URL */
//@property (nonatomic , copy) NSString * shopHeadimg;
///** 店铺环境展示URL */
//@property (nonatomic , copy) NSString * shopEnvironmentimgUrl;
///** 店铺所在位置经度 */
//@property (nonatomic , copy) NSString * lon;
///** 店铺所在位置维度 */
//@property (nonatomic , copy) NSString * lat;
/** ---------店铺商品图片描述 -------- */
//@property (nonatomic , copy) NSString * shopGoodsimgUrl;
///** 商品名称 */
//@property (nonatomic , copy) NSString * shopGoodsname;
///** 商品价格 */
//@property (nonatomic , copy) NSString * shopGoodsprice;
///** -------------用户评论 ----------details 详情   -- level 级别*/
///** 用户id */
//@property (nonatomic , copy) NSString * consumerId;
///** 用户头像 */
//@property (nonatomic , copy) NSString * consumerImg;
///** 用户昵称 */
//@property (nonatomic , copy) NSString * consumerName;
///** 用户交易类型 */
//@property (nonatomic , copy) NSString * dealKind;
///** 评论时间 */
//@property (nonatomic , copy) NSString * commentTime;
///** 星级 */
//@property (nonatomic , copy) NSString * level;
///** 评论详情 */
//@property (nonatomic , copy) NSString * commentDet;
//
#import "ShoplistModel.h"

@implementation ShoplistModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
       
        //        _price = dict[@"price"];
        //        _title = dict[@"title"];
        
        
        // 灌入字典
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)shoplistDict:(NSDictionary *)dict
{
    ShoplistModel *shopInfo  = [[ShoplistModel alloc] init];
    
    shopInfo.isReserve = dict[@"isReserve"];
    shopInfo.shopId = dict[@"shopId"];
    shopInfo.shopName = dict[@"shopName"];
    shopInfo.shopListName = dict[@"shopListName"];
    shopInfo.shopimgUrl = dict[@"shopimgUrl"];
    shopInfo.backMoney  = dict[@"backMoney"];
    shopInfo.cityName = dict[@"cityName"];
    shopInfo.addressName = dict[@"addressName"];
    shopInfo.kindName = dict[@"kindName"];
    shopInfo.shopHeadimg = dict[@"shopHeadimg"];
    shopInfo.shopListimg = dict[@"shopListimg"];
    shopInfo.shopEnvironmentimgUrl = dict[@"shopEnvironmentimgUrl"];
    shopInfo.lon = dict[@"lon"];
    shopInfo.lat = dict[@"lat"];
    shopInfo.shopGoodsimgUrl = dict[@"shopGoodsimgUrl"];
    shopInfo.shopGoodsname = dict[@"shopGoodsname"];
    shopInfo.shopGoodsprice = dict[@"shopGoodsprice"];
    shopInfo.consumerId = dict[@"consumerId"];
    shopInfo.consumerImg = dict[@"consumerImg"];
    shopInfo.consumerName = dict[@"consumerName"];
    shopInfo.dealKind = dict[@"dealKind"];
    shopInfo.commentTime = dict[@"commentTime"];
    shopInfo.level = dict[@"level"];
    shopInfo.commentDet = dict[@"commentDet"];
    
    return shopInfo;
}

@end
