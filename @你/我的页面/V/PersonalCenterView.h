//
//  PersonalCenterView.h
//  @的你
//
//  Created by 吴明飞 on 16/3/29.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCenterView : UIView
//头像
@property (nonatomic, strong) UIImageView *headImageView;
//昵称
@property (nonatomic, strong) UILabel *nickLabel;
//账号/电话
@property (nonatomic, strong) UILabel *accountNumberLabel;
//个人资料按钮
@property (nonatomic, strong) UIButton *personalDataBtn;
//消费记录按钮
@property (nonatomic, strong) UIButton *consumerNotesBtn;
//收藏夹按钮
@property (nonatomic, strong) UIButton *collectListBtn;
//修改支付密码按钮
@property (nonatomic, strong) UIButton *alertSecretBtn;
//联系客服按钮
@property (nonatomic, strong) UIButton *contactServiceBtn;
//商家入驻按钮
@property (nonatomic, strong) UIButton *addShoperBtn;
//退出登录
@property (nonatomic, strong) UIButton *backLoginBtn;
@end
