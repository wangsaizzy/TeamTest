//
//  LoginAndRegistViewController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/14.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "LoginAndRegistViewController.h"
#import "PersonalCenterController.h"
#import "ShopManagerController.h"
#import "TestStatusViewController.h"
#import "RegistViewController.h"
#import "AlertSecretController.h"
#import "LoginView.h"
#import "LoginModel.h"
#import "UserModel.h"
#import "HttpHelper.h"
@interface LoginAndRegistViewController ()
@property (nonatomic, strong) LoginView *loginView;
@end

@implementation LoginAndRegistViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    _loginView.accountNumberTF.text = [UserModel defaultModel].phone;
    _loginView.secretNumberTF.text = [UserModel defaultModel].password;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
}

#pragma mark -SetupViews
- (void)setupViews {
    
    if (_isFromHomeView) {
        [self addNavigationBackButton];
    }
    
    self.loginView = [[LoginView alloc] initWithFrame:self.view.bounds];
    self.view = _loginView;
    [_loginView.forgetSecretBtn addTarget:self action:@selector(forgetSecretBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_loginView.loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_loginView.registBtn addTarget:self action:@selector(registBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

// 返回按钮
- (void)addNavigationBackButton
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(0, 0, 44, 44)];
    [backBtn addTarget:self action:@selector(selectBackBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *img = [[UIImageView alloc]init];
    [img setFrame:CGRectMake(0, 15, 10, 15)];
    [img setImage:[UIImage imageNamed:@"backImage"]];
    
    [backBtn addSubview:img];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
}

// 点击返回
- (void)selectBackBtnAction
{
    if ([self.navigationController popViewControllerAnimated:YES]==nil)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark -forgetSecretBtnAction:
- (void)forgetSecretBtnAction:(UIButton *)sender {
    [self colsedKeyBoard:nil];
    TestStatusViewController *testVC = [[TestStatusViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}

#pragma mark -loginBtnAction
- (void)loginBtnAction:(UIButton *)sender {
    if (_loginView.accountNumberTF.text.length == 0) {
        ShowAlertView(@"请输入账号");
        return;
    }
    if (_loginView.secretNumberTF.text.length == 0) {
        ShowAlertView(@"请输入密码");
        return;
    }
    
    WS(weakself);
    [SVProgressHUD show];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:_loginView.accountNumberTF.text forKey:@"phone"];
    [dict setObject:_loginView.secretNumberTF.text forKey:@"password"];
    [dict setObject:@"IOS" forKey:@"deviceType"];
    
    [HttpHelper post:KLogin_url param:dict finishBlock:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            
            [weakself parseData:data];
            
        } else {
            [SVProgressHUD dismiss];
            ShowAlertView(@"登录失败");
        }
    }];
    
}

- (void)parseData:(NSData *)data {
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if (dict) {
        NSLog(@"%@", dict);
        LoginModel *model = [[LoginModel alloc] initWithDic:dict];
        [UserModel defaultModel].user = model;
        
        [UserModel defaultModel].isAppLogin = YES;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginSuccess" object:nil];
        
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        
        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        
    } else {
        [SVProgressHUD dismiss];
        ShowAlertView(@"登录失败");
    }
}



#pragma mark -registBtnAction
- (void)registBtnAction:(UIButton *)sender {
    [self colsedKeyBoard:nil];
    RegistViewController *registVC = [[RegistViewController alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
}

- (void)colsedKeyBoard:(id)sender {
    [self.loginView.accountNumberTF resignFirstResponder];
    [self.loginView.secretNumberTF resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
