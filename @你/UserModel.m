//
//  UserModel.m
//  @的你
//
//  Created by 吴明飞 on 16/4/5.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "UserModel.h"

NSString *const k_UserDefaults_user = @"k_UserDefaults_user";

@implementation UserModel
static UserModel *singletonModel = nil;
+ (UserModel *)defaultModel {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singletonModel = [[UserModel alloc] init];
    });
    return singletonModel;
}


- (void)setIsAppLogin:(BOOL)isAppLogin
{
    [[NSUserDefaults standardUserDefaults] setBool:isAppLogin forKey:@"isAppLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (BOOL)isAppLogin
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"isAppLogin"];
}


//*************************用户信息****************************
-(void)setPhone:(NSString *)phone {
    [[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"phone"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)phone {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"phone"];
}

- (void)setName:(NSString *)name {
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
}

- (NSString *)name {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
}

- (void)setPassword:(NSString *)password {
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)password {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
}

- (void)setSex:(NSString *)sex {
    [[NSUserDefaults standardUserDefaults] setObject:sex forKey:@"sex"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)sex {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"sex"];
}







- (void)clearUserModel {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@""];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@""];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@""];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@""];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:k_UserDefaults_user];

    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
