//
//  LoginModel.h
//  ATN
//
//  Created by 吴明飞 on 16/4/29.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

@property (nonatomic, copy) NSString *token;
@property (nonatomic, strong) NSNumber *userId;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
