//
//  ShoplistModel.h
//  @你
//
//  Created by 王赛 on 16/4/25.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoplistModel : NSObject

/** 是否需要预约 状态 */
@property (nonatomic , copy) NSString * isReserve;
/** 店铺Id */
@property (nonatomic , copy) NSString * shopId;
/** 店铺名字 */
@property (nonatomic , copy) NSString * shopName;
/** 店铺名字拼接地址 */
@property (nonatomic , copy) NSString * shopListName;
/** 店铺图片URL地址字符串 */
@property (nonatomic , copy) NSString * shopimgUrl;
/**  店铺返现额度 */
@property (nonatomic , copy) NSString * backMoney;
/** 店铺城市地址 */
@property (nonatomic , copy) NSString * cityName;
/** 店铺详细地址 */
@property (nonatomic , copy) NSString * addressName;
/** 店铺类型 */
@property (nonatomic , copy) NSString * kindName;
/** 店铺列表头像URL（展示在列表中） */
@property (nonatomic , copy) NSString * shopListimg;
/** 店铺头像URL */
@property (nonatomic , copy) NSString * shopHeadimg;
/** 店铺环境展示URL */
@property (nonatomic , copy) NSString * shopEnvironmentimgUrl;
/** 店铺所在位置经度 */
@property (nonatomic , copy) NSString * lon;
/** 店铺所在位置维度 */
@property (nonatomic , copy) NSString * lat;

/** ---------店铺商品图片描述 -------- */
@property (nonatomic , copy) NSString * shopGoodsimgUrl;
/** 商品名称 */
@property (nonatomic , copy) NSString * shopGoodsname;
/** 商品价格 */
@property (nonatomic , copy) NSString * shopGoodsprice;

/** -------------用户评论 ----------details 详情   -- level 级别*/
/** 用户id */
@property (nonatomic , copy) NSString * consumerId;
/** 用户头像 */
@property (nonatomic , copy) NSString * consumerImg;
/** 用户昵称 */
@property (nonatomic , copy) NSString * consumerName;
/** 用户交易类型 */
@property (nonatomic , copy) NSString * dealKind;
/** 评论时间 */
@property (nonatomic , copy) NSString * commentTime;
/** 星级 */
@property (nonatomic , copy) NSString * level;
/** 评论详情 */
@property (nonatomic , copy) NSString * commentDet;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)shoplistDict:(NSDictionary *)dict;

@end
