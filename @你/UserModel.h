//
//  UserModel.h
//  @的你
//
//  Created by 吴明飞 on 16/4/5.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

@interface UserModel : NSObject
@property (nonatomic, strong) LoginModel *user;
@property (nonatomic, copy) NSString *phone;//手机号
@property (nonatomic, copy) NSString *name;//昵称
@property (nonatomic, copy) NSString *password;//密码
@property (nonatomic, copy) NSString *uid;//用户标识
@property (nonatomic, copy) NSString *message;//登录状态描述
@property (nonatomic, assign) int status;
@property (nonatomic, copy) NSString *sex;//性别
@property (nonatomic, copy) NSString *portrait;//头像URL
@property (nonatomic, copy) NSString *area;

@property (nonatomic, assign) BOOL isAppLogin;

//单例模式
+ (UserModel *)defaultModel;



//清空用户数据
- (void)clearUserModel;
@end
