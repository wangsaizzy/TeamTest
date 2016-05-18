//
//  DrawMoneyController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/28.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "DrawMoneyController.h"
#import "ApplyCashController.h"
#import "BingDingNumberController.h"
#import "HistoryCashController.h"
#import "DrawMoneyView.h"
@interface DrawMoneyController ()
@property (nonatomic, strong) NSString *accountNumberString;
@end

@implementation DrawMoneyController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    //添加方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction:) name:@"accountNumber" object:NULL];
    //从本地取数据
    //self.accountNumberString = [[NSUserDefaults standardUserDefaults] stringForKey:@"accountNumberStr"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    [self viewDidLoad];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    DrawMoneyView *drawView = [[DrawMoneyView alloc] initWithFrame:self.view.bounds];
    self.view = drawView;
    if (self.accountNumberString.length == 0) {
        drawView.accountLabel.hidden = YES;
        drawView.directApplyFirstImage.hidden = YES;
        drawView.directHistorySecondImage.hidden = YES;
    } else if (self.accountNumberString.length > 0) {
        drawView.directFirstImage.hidden = YES;
        drawView.bangDingLabel.hidden = YES;
        drawView.accountLabel.text = self.accountNumberString;
    }
    
    //绑定账号按钮
    [drawView.accountBtn addTarget:self action:@selector(accountBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //申请提现按钮
    [drawView.applyCashBtn addTarget:self action:@selector(applyCashBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //历史提现按钮
    [drawView.historyCashBtn addTarget:self action:@selector(historyCashBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -绑定提现账号按钮点击事件
- (void)accountBtnAction:(UIButton *)sender {
    if (self.accountNumberString.length == 0) {
        BingDingNumberController *numberVC = [[BingDingNumberController alloc] init];
        [self.navigationController pushViewController:numberVC animated:YES];
    } else if (self.accountNumberString.length > 0) {
        return;
    }
   
}

#pragma mark -申请提现按钮点击事件
- (void)applyCashBtnAction:(UIButton *)sender {
//    if (self.accountNumberString.length == 0) {
//        return;
//    } else if (self.accountNumberString.length > 0) {
//        ApplyCashController *applyVC = [[ApplyCashController alloc] init];
//        [self.navigationController pushViewController:applyVC animated:YES];
//    }
    ApplyCashController *applyVC = [[ApplyCashController alloc] init];
    [self.navigationController pushViewController:applyVC animated:YES];
}

#pragma mark -历史提现按钮点击事件
- (void)historyCashBtnAction:(UIButton *)sender {
    
    HistoryCashController *cashVC = [[HistoryCashController alloc] init];
    [self.navigationController pushViewController:cashVC animated:YES];
    
}

//通知的方法
- (void)notificationAction:(NSNotification *)sender {
    self.accountNumberString = [sender.userInfo objectForKey:@"ACCOUNTNUMBER"];
}

//移除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"accountNumber" object:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
