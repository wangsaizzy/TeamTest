//
//  RegistView.h
//  @的你
//
//  Created by 吴明飞 on 16/3/15.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistView : UIView
@property (nonatomic, strong) UITextField *phoneNumberTF;//手机号
@property (nonatomic, strong) UITextField *bringTestNumberTF;//验证码
@property (nonatomic, strong) UITextField *setUpSecretTF;//密码
@property (nonatomic, strong) UIButton *acquireBtn;//获取验证码
@property (nonatomic, strong) UIButton *registBtn;//注册

@end
