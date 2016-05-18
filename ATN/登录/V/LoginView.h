//
//  LoginView.h
//  @的你
//
//  Created by 吴明飞 on 16/3/14.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView
@property (nonatomic, strong) UIImageView *customerPhotoImageView;
@property (nonatomic, strong) UITextField *accountNumberTF;
@property (nonatomic, strong) UITextField *secretNumberTF;
@property (nonatomic, strong) UIButton *forgetSecretBtn;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registBtn;

@end
