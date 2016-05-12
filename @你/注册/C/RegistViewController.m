//
//  RegistViewController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/15.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "RegistViewController.h"
#import "AFNetworking.h"
#import "RegistView.h"
#import "UserModel.h"
#import "HttpHelper.h"


@interface RegistViewController ()
@property (nonatomic, strong) RegistView *registView;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViews];
}

- (void)setupViews {
    self.title = @"注册";
    self.registView = [[RegistView alloc] initWithFrame:self.view.bounds];
    self.view = _registView;
    
    //获取验证码按钮
    [_registView.acquireBtn addTarget:self action:@selector(acquireBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //注册按钮
    [_registView.registBtn addTarget:self action:@selector(registBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

//获取验证码
- (void)acquireBtnAction:(UIButton *)sender {
    [self colsedKeyBoard:nil];
    if (_registView.phoneNumberTF.text.length == 0) {
        ShowAlertView(@"请输入手机号");
        return;
    }
    [SVProgressHUD show];
    __weak typeof(self) weakSelf = self;
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.registView.phoneNumberTF.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        [SVProgressHUD dismiss];
        if (!error) {
            
            [weakSelf countDown];
            ShowAlertView(@"获取验证码成功");
            [SVProgressHUD dismiss];
        } else {
            
            ShowAlertView(@"获取验证码失败");
            [SVProgressHUD dismiss];
        }
  
    }];
}

//注册
- (void)registBtnAction:(UIButton *)sender {
    [self colsedKeyBoard:nil];
    if (_registView.phoneNumberTF.text.length == 0) {
        ShowAlertView(@"请输入手机号");
        return;
    }
    if (_registView.bringTestNumberTF.text.length == 0) {
        ShowAlertView(@"请输入验证码");
        return;
    }
    if (_registView.setUpSecretTF.text.length == 0) {
        ShowAlertView(@"请输入密码");
        return;
    }
    
    
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    [dict setObject:self.registView.phoneNumberTF.text forKey:@"phone"];
    [dict setObject:self.registView.setUpSecretTF.text forKey:@"password"];
    [dict setObject:@"IOS" forKey:@"deviceType"];
    [dict setObject:@"meide" forKey:@"name"];
    [dict setObject:@"kong1" forKey:@"captcha"];
    WS(weakself);
    
    [HttpHelper post:Ksingup_url param:dict finishBlock:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data) {
            
            [weakself parseData:data];
            
        } else {
            [SVProgressHUD dismiss];
            ShowAlertView(@"注册失败");
        }
        
    }];

    
}



- (void)parseData:(NSData *)data {
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if (dict) {
        NSLog(@"%@", dict);
        
        [SVProgressHUD showSuccessWithStatus:@"恭喜您注册成功"];
        
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [SVProgressHUD showErrorWithStatus:@"注册失败"];
        
    }
}

    



#pragma mark - 验证码倒计时
- (void)countDown {
    WS(weakself);
    __block int timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if (timeout <= 0) {
            //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据需要自己设置
                weakself.registView.acquireBtn.enabled = YES;
                NSString *downStr = [NSString stringWithFormat:@"%@", @"获取验证码"];
                [weakself.registView.acquireBtn setTitle:downStr forState:UIControlStateNormal];
                [weakself.registView.acquireBtn.titleLabel setFont:[UIFont systemFontOfSize:17 * kMulriple]];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据需要自己设置
                weakself.registView.acquireBtn.enabled = NO;
                NSString *downStr = [NSString stringWithFormat:@"%d%@",timeout, @"s后再次获取"];
                [weakself.registView.acquireBtn setTitle:downStr forState:UIControlStateNormal];
                [weakself.registView.acquireBtn.titleLabel setFont:[UIFont systemFontOfSize:13 * kMulriple]];
                timeout--;
            });
        }
        
    });
    dispatch_resume(_timer);
}

//关闭键盘
- (void)colsedKeyBoard:(id)sender {
    [self.registView.phoneNumberTF resignFirstResponder];
    [self.registView.bringTestNumberTF resignFirstResponder];
    [self.registView.setUpSecretTF resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
