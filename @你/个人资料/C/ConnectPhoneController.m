//
//  ConnectPhoneController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/16.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "ConnectPhoneController.h"
#import "ConnectPhoneView.h"
@interface ConnectPhoneController ()
{
    ConnectPhoneView *_phoneView;
}
@end

@implementation ConnectPhoneController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改绑定手机";
    [self setupViews];
}

- (void)setupViews {
    _phoneView = [[ConnectPhoneView alloc] initWithFrame:self.view.bounds];
    _phoneView.backgroundColor = RGB(237, 237, 237);
    self.view = _phoneView;
    
    [_phoneView.acquireTestBtn addTarget:self action:@selector(acquireBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_phoneView.commitBtn addTarget:self action:@selector(commitAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -获取验证码按钮点击事件
- (void)acquireBtnAction:(UIButton *)sender {
    [self colsedKeyBoard:nil];
    if (_phoneView.phoneNumberTF.text.length == 0) {
        ShowAlertView(@"请输入手机号");
        return;
    }
    [SVProgressHUD show];
    __weak typeof(self) weakSelf = self;
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phoneView.phoneNumberTF.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
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

#pragma mark -提交修改按钮点击事件
- (void)commitAction:(UIButton *)sender {
    
}

#pragma mark - 验证码倒计时
- (void)countDown {
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
                _phoneView.acquireTestBtn.enabled = YES;
                NSString *downStr = [NSString stringWithFormat:@"%@", @"获取验证码"];
                [_phoneView.acquireTestBtn setTitle:downStr forState:UIControlStateNormal];
                [_phoneView.acquireTestBtn.titleLabel setFont:[UIFont systemFontOfSize:13 * kMulriple]];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据需要自己设置
                _phoneView.acquireTestBtn.enabled = NO;
                NSString *downStr = [NSString stringWithFormat:@"%d%@",timeout, @"s后再次获取"];
                [_phoneView.acquireTestBtn setTitle:downStr forState:UIControlStateNormal];
                [_phoneView.acquireTestBtn.titleLabel setFont:[UIFont systemFontOfSize:13 * kMulriple]];
                timeout--;
            });
        }
        
    });
    dispatch_resume(_timer);
}

//关闭键盘
- (void)colsedKeyBoard:(id)sender {
    [_phoneView.phoneNumberTF resignFirstResponder];
    [_phoneView.bringTestNumberTF resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
