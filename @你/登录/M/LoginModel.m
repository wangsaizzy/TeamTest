//
//  LoginModel.m
//  @你
//
//  Created by 吴明飞 on 16/4/29.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"shop"]) {
        self.userId = value[@"userId"];
    }
}

@end
