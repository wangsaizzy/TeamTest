//
//  GoodsModel.h
//  ATN
//
//  Created by 吴明飞 on 16/5/9.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property (nonatomic, copy) NSString *url;//图片URL
@property (nonatomic, copy) NSString *name;//商品名称
@property (nonatomic, copy) NSNumber *number;//数量
@property (nonatomic, copy) NSNumber *id;//商品唯一标识

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
