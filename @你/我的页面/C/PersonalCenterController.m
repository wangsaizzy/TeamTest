//
//  PersonalCenterController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/29.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "PersonalCenterController.h"
#import "PersonalCenterView.h"
#import "PersonalSetUpController.h"
#import "AlertPersonalDataViewController.h"
#import "ShopManagerController.h"
#import "AlertSecretController.h"
#import "CenterViewController.h"
#import "PersonalSetUpController.h"
#import "LoginAndRegistViewController.h"
#import "AddShoperController.h"
#import "TestStatusViewController.h"
#import "CollectNotesController.h"
#import "LoginAndRegistViewController.h"
#import "UserModel.h"
@interface PersonalCenterController ()

@end

@implementation PersonalCenterController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    [self refreshViewData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self customNaviBar];
}

- (void)setupViews {
   
    
    PersonalCenterView *centerView = [[PersonalCenterView alloc] initWithFrame:self.view.bounds];
    self.view = centerView;
    
    //个人资料按钮点击事件
    [centerView.personalDataBtn addTarget:self action:@selector(personalDataBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //消费记录按钮点击事件
    [centerView.consumerNotesBtn addTarget:self action:@selector(consumerNotesBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //收藏夹按钮点击事件
    [centerView.collectListBtn addTarget:self action:@selector(collectListBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //修改支付密码按钮点击事件
    [centerView.alertSecretBtn addTarget:self action:@selector(alertSecretBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //联系客服按钮点击事件
    [centerView.contactServiceBtn addTarget:self action:@selector(contactServiceBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //商家入驻按钮点击事件
    [centerView.addShoperBtn addTarget:self action:@selector(addShoperBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //退出登录按钮点击事件
    [centerView.backLoginBtn addTarget:self action:@selector(backLoginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

//导航栏
- (void)customNaviBar {
     self.title = @"个人中心";
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"设置_黑"] style:UIBarButtonItemStylePlain target:self action:@selector(personalSetupAction:)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = right;
}

// 刷新界面
- (void)refreshViewData
{
    if ([UserModel defaultModel].isAppLogin)
    {
        // 用户头像
        
        
        // 总收入
        
        
        // 用户昵称
       
    }
    else
    {
        // 进入登录页面
       LoginAndRegistViewController *loginView = [[LoginAndRegistViewController alloc]init];
        loginView.isFromHomeView = YES;
        UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:loginView];
        navVC.navigationBar.translucent = NO;
        [self presentViewController:navVC animated:YES completion:nil];
        
        
    }
}


#pragma mark -点击进入个人设置
- (void)personalSetupAction:(UIBarButtonItem *)sender {
    PersonalSetUpController *personalVC = [[PersonalSetUpController alloc] init];
    [self.navigationController pushViewController:personalVC animated:YES];
}

#pragma mark -个人资料
- (void)personalDataBtnAction:(UIButton *)sender {
    AlertPersonalDataViewController *alertVC = [[AlertPersonalDataViewController alloc] init];
    [self.navigationController pushViewController:alertVC animated:YES];
}

#pragma mark -消费记录
- (void)consumerNotesBtnAction:(UIButton *)sender {
    CenterViewController *centerVC = [[CenterViewController alloc] init];
    [self.navigationController pushViewController:centerVC animated:YES];
}

#pragma mark -收藏夹
- (void)collectListBtnAction:(UIButton *)sender {
    
    CollectNotesController *collectVC = [[CollectNotesController alloc] init];
    [self.navigationController pushViewController:collectVC animated:YES];
    
}

#pragma mark -修改支付密码
- (void)alertSecretBtnAction:(UIButton *)sender {
    
    TestStatusViewController *testVC = [[TestStatusViewController alloc] init];
    static NSInteger c = 2;
    testVC.index = c;
    [self.navigationController pushViewController:testVC animated:YES];
    
}

#pragma mark -联系客服
- (void)contactServiceBtnAction:(UIButton *)sender {
    ShopManagerController *shopVC = [[ShopManagerController alloc] init];
    [self.navigationController pushViewController:shopVC animated:YES];
}

#pragma mark -商家入驻
- (void)addShoperBtnAction:(UIButton *)sender {
    AddShoperController *addVC = [[AddShoperController alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
}

#pragma mark -退出登录
- (void)backLoginBtnAction:(UIButton *)sender {
    LoginAndRegistViewController *loginVC = [[LoginAndRegistViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES]
    ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
