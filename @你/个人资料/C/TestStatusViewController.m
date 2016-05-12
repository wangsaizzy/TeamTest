//
//  TestStatusViewController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/16.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "TestStatusViewController.h"
#import "AlertSecretController.h"
#import "ConnectPhoneController.h"
#import "AlertPaySecretController.h"
#import "TestStatusView.h"
@interface TestStatusViewController ()
{
    TestStatusView *_testView;
}
@end

@implementation TestStatusViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证身份";
    [self setupViews];
}

- (void)setupViews {
    _testView = [[TestStatusView alloc] initWithFrame:self.view.bounds];
   self.view = _testView;
    [_testView.acquireTestBtn addTarget:self action:@selector(acquireTestBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_testView.testStatusBtn addTarget:self action:@selector(testStatusBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -acquireTestBtnAction
- (void)acquireTestBtnAction:(UIButton *)sender {
    [self colsedKeyBoard:nil];
    if (_testView.phoneNumberTF.text.length == 0) {
        ShowAlertView(@"请输入手机号");
        return;
    }
    [SVProgressHUD show];
    __weak typeof(self) weakSelf = self;
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_testView.phoneNumberTF.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
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

#pragma mark -testStatusBtnAction
- (void)testStatusBtnAction:(UIButton *)sender {
    
    if (self.index == 0) {
        AlertSecretController *secretVC = [[AlertSecretController alloc] init];
        [self.navigationController pushViewController:secretVC animated:YES];
    } else if (self.index == 1) {
        ConnectPhoneController *phoneVC = [[ConnectPhoneController alloc] init];
        [self.navigationController pushViewController:phoneVC animated:YES];
    } else if (self.index == 2) {
        AlertPaySecretController *payVC = [[AlertPaySecretController alloc] init];
        [self.navigationController pushViewController:payVC animated:YES];
    }
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
                _testView.acquireTestBtn.enabled = YES;
                NSString *downStr = [NSString stringWithFormat:@"%@", @"获取验证码"];
                [_testView.acquireTestBtn setTitle:downStr forState:UIControlStateNormal];
                [_testView.acquireTestBtn.titleLabel setFont:[UIFont systemFontOfSize:13 * kMulriple]];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据需要自己设置
                _testView.acquireTestBtn.enabled = NO;
                NSString *downStr = [NSString stringWithFormat:@"%d%@",timeout, @"s后再次获取"];
                [_testView.acquireTestBtn setTitle:downStr forState:UIControlStateNormal];
                [_testView.acquireTestBtn.titleLabel setFont:[UIFont systemFontOfSize:13 * kMulriple]];
                timeout--;
            });
        }
        
    });
    dispatch_resume(_timer);
}

//关闭键盘
- (void)colsedKeyBoard:(id)sender {
    [_testView.phoneNumberTF resignFirstResponder];
    [_testView.bringTestNumberTF resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
