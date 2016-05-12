//
//  GoodsModel.m
//  @你
//
//  Created by 吴明飞 on 16/5/9.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"img"]) {
        self.url = value[@"img"][@"portrait"][@"url"];
    }
}

@end
