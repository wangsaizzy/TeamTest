//
//  ShopManagerController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/24.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "ShopManagerController.h"
#import "PersonalSetUpController.h"
#import "TodayIncomeController.h"
#import "UIView+Addition.h"
#import "CaiWuDuiZhangController.h"
#import "DrawMoneyController.h"
#import "ShopInformationController.h"
#import "ManagerProductController.h"
#import "UserCommentController.h"
#import "TodayListController.h"
#import "LoginAndRegistViewController.h"

@interface ShopManagerController ()

@end

@implementation ShopManagerController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //布局视图
    [self setupViews];
}

- (void)setupViews {
    //设置背景色
    self.view.backgroundColor = RGB(237, 237, 237);
   
    //背景视图
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWight, 200 * kHMulriple)];
    
    //头像
    UIImageView *photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(147 * kMulriple, 25 * kHMulriple, 80 * kMulriple, 80 * kHMulriple)];
    photoImageView.layer.cornerRadius = 40 * kMulriple;
    photoImageView.layer.masksToBounds = YES;
    photoImageView.backgroundColor = [UIColor blueColor];
    [headView addSubview:photoImageView];
    
    //昵称
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(147 * kMulriple, 115 * kHMulriple, 240 * kMulriple, 20 * kHMulriple)];
    nameLabel.centerX = kWight / 2;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.text = @"周黑鸭(百子湾店)";
    [headView addSubview:nameLabel];
    
    //个人设置按钮
    UIButton *setUpBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    setUpBtn.frame = CGRectMake(kWight - 50 * kMulriple, 15 * kHMulriple, 30 * kMulriple, 30 * kHMulriple);
    [setUpBtn setBackgroundImage:[UIImage imageNamed:@"通用-设置_白"] forState:UIControlStateNormal];
    
    [setUpBtn addTarget:self action:@selector(setUpBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:setUpBtn];
    
    //消息按钮
    UIButton *messageBtn = [[UIButton alloc] initWithFrame:CGRectMake(115 * kMulriple, 150 * kHMulriple, 40 * kMulriple, 40 * kHMulriple)];
    [messageBtn addTarget:self action:@selector(messageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [messageBtn setImage:[UIImage imageNamed:@"通用-消息_白"] forState:UIControlStateNormal];
    [headView addSubview:messageBtn];
    
    //二维码按钮
    UIButton *codeBtn = [[UIButton alloc] initWithFrame:CGRectMake(220 * kMulriple, 150 * kHMulriple, 40 * kMulriple, 40 * kHMulriple)];
    [codeBtn setImage:[UIImage imageNamed:@"2商家-二维码"] forState:UIControlStateNormal];
    [codeBtn addTarget:self action:@selector(codeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:codeBtn];
    headView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:headView];
    
    //中间视图
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 200 * kHMulriple, kWight, 100 * kHMulriple)];
    secondView.backgroundColor = [UIColor whiteColor];
    //今日收入按钮
    UIButton *inComeBtn = [[UIButton alloc] initWithFrame:CGRectMake(50 * kMulriple, 15 * kHMulriple, 100 * kMulriple, 80 * kHMulriple)];
    [inComeBtn addTarget:self action:@selector(inComeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    //今日收入
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5 * kHMulriple, 100 * kMulriple, 30 * kHMulriple)];
    priceLabel.centerX = inComeBtn.width / 2;
    priceLabel.textColor = [UIColor redColor];
    priceLabel.text = @"325";
    priceLabel.textAlignment = NSTextAlignmentCenter;
    priceLabel.font = [UIFont systemFontOfSize:30 * kMulriple];
    [inComeBtn addSubview:priceLabel];
    
    UILabel *todayLabel = [[UILabel alloc] initWithFrame:CGRectMake(5 * kMulriple, 40 * kHMulriple, 90 * kMulriple, 25 * kHMulriple)];
    todayLabel.centerX = inComeBtn.width / 2;
    todayLabel.text = @"今日收入";
    todayLabel.textAlignment = NSTextAlignmentCenter;
    [inComeBtn addSubview:todayLabel];
    [secondView addSubview:inComeBtn];
    
    //今日订单按钮
    UIButton *listBtn = [[UIButton alloc] initWithFrame:CGRectMake(225 * kMulriple, 15 * kHMulriple, 100 * kMulriple, 100 * kHMulriple)];
    [listBtn addTarget:self action:@selector(listBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *acountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5 * kHMulriple, 100 * kMulriple, 30 * kHMulriple)];
    acountLabel.centerX = inComeBtn.width / 2;
    acountLabel.textColor = [UIColor redColor];
    acountLabel.text = @"24";
    acountLabel.textAlignment = NSTextAlignmentCenter;
    acountLabel.font = [UIFont systemFontOfSize:30 * kMulriple];
    [listBtn addSubview:acountLabel];
    
    UILabel *listLabel = [[UILabel alloc] initWithFrame:CGRectMake(5 * kMulriple, 40 * kHMulriple, 90 * kMulriple, 25 * kHMulriple)];
    listLabel.centerX = inComeBtn.width / 2;
    listLabel.text = @"今日订单";
    listLabel.textAlignment = NSTextAlignmentCenter;
    [listBtn addSubview:listLabel];
    [secondView addSubview:listBtn];
    
    [self.view addSubview:secondView];
    //分类视图
    UIView *categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 302 * kHMulriple, kWight, kHeight - 322 * kHMulriple)];
    categoryView.backgroundColor = RGB(237, 237, 237);
    NSArray *firstLineImageArr = @[@"2商家-财务对账",@"2商家-收入提现",@"2商家-店铺信息"];
    NSArray *firstLineLabelArr = @[@"财务对账", @"收入提现", @"店铺信息"];
    for (int i = 0; i < 3; i++) {
        
        //第一行按钮
        UIButton *firstLineBtn = [[UIButton alloc] initWithFrame:CGRectMake(i * 125 * kMulriple, 0, 122 * kMulriple, 103 * kHMulriple)];
        firstLineBtn.backgroundColor = [UIColor whiteColor];
        UIImageView *firstLineBtnImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:firstLineImageArr[i]]];
        [firstLineBtn addSubview:firstLineBtnImage];
        firstLineBtnImage.centerX = firstLineBtn.width / 2;
        firstLineBtnImage.centerY = 70  * kHMulriple / 2;
        UILabel *firstLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, firstLineBtnImage.frame.size.height + 7, firstLineBtn.frame.size.width, 12)];
        firstLineLabel.font = [UIFont systemFontOfSize:14];
        firstLineLabel.textAlignment = NSTextAlignmentCenter;
        firstLineLabel.text = firstLineLabelArr[i];
        firstLineLabel.centerY = 140 * kHMulriple / 2;
        [firstLineBtn addSubview:firstLineLabel];
        [firstLineBtn addTarget:self action:@selector(firstLineBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        firstLineBtn.tag = 100 + i;
        [categoryView addSubview:firstLineBtn];
    }
    
    NSArray *secondLineImageArr = @[@"2商家-产品管理",@"2商家-评价管理", @"2商家-业务经理"];
    NSArray *secondLineLabelArr = @[@"管理产品", @"查看评价", @"联系业务经理"];
    for (int j = 0; j < 3; j++) {
        
        //第二行按钮
        UIButton *secondLineBtn = [[UIButton alloc] initWithFrame:CGRectMake(125 * j * kMulriple, 105 * kHMulriple, 122 * kMulriple, 103 * kHMulriple)];
        secondLineBtn.backgroundColor = [UIColor whiteColor];
        UIImageView *secondLineBtnImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:secondLineImageArr[j]]];
        [secondLineBtn addSubview:secondLineBtnImage];
        secondLineBtnImage.centerX = secondLineBtn.width / 2;
        secondLineBtnImage.centerY = 70 * kHMulriple * kHMulriple / 2;
        UILabel *secondLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, secondLineBtnImage.frame.size.height + 7, secondLineBtn.frame.size.width, 12)];
        secondLineLabel.font = [UIFont systemFontOfSize:14];
        secondLineLabel.textAlignment = NSTextAlignmentCenter;
        secondLineLabel.text = secondLineLabelArr[j];
        secondLineLabel.centerY = 140 * kHMulriple / 2;
        [secondLineBtn addSubview:secondLineLabel];
        [secondLineBtn addTarget:self action:@selector(secondLineBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        secondLineBtn.tag = 200 + j;
        [categoryView addSubview:secondLineBtn];
    }
    //第三行按钮
    UIButton *thirdLineBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 210 * kHMulriple, 122 * kMulriple, 103 * kHMulriple)];
    thirdLineBtn.backgroundColor = [UIColor whiteColor];
    UIImageView *thirdLineBtnImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2商家-退出登录"]];
    [thirdLineBtn addSubview:thirdLineBtnImage];
    thirdLineBtnImage.centerX = thirdLineBtn.width / 2;
    thirdLineBtnImage.centerY = 70 * kHMulriple * kHMulriple / 2;
    UILabel *thirdLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, thirdLineBtnImage.frame.size.height + 7, thirdLineBtn.frame.size.width, 12)];
    thirdLineLabel.font = [UIFont systemFontOfSize:14];
    thirdLineLabel.textAlignment = NSTextAlignmentCenter;
    thirdLineLabel.text = @"退出登录";
    thirdLineLabel.centerY = 140 * kHMulriple / 2;
    [thirdLineBtn addSubview:thirdLineLabel];
    [thirdLineBtn addTarget:self action:@selector(thirdLineBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [categoryView addSubview:thirdLineBtn];
    
    [self.view addSubview:categoryView];
}

#pragma mark -跳转到个人设置页面
- (void)setUpBtnAction:(UIButton *)sender {
    PersonalSetUpController *personVC = [[PersonalSetUpController alloc] init];
    [self.navigationController pushViewController:personVC animated:YES];
}

#pragma mark -跳转到系统消息页面
- (void)messageBtnAction:(UIButton *)sender {
    
}

#pragma mark -跳转到二维码页面
- (void)codeBtnAction:(UIButton *)sender {
    
}

#pragma mark -跳转到今日收入页面
- (void)inComeBtnAction:(UIButton *)sender {
    
    TodayIncomeController *todayVC = [[TodayIncomeController alloc] init];
    [self.navigationController pushViewController:todayVC animated:YES];
    
}

#pragma mark -跳转到今日订单页面
- (void)listBtnAction:(UIButton *)sender {
    
    TodayListController *listVC = [[TodayListController alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
    
}

#pragma mark -第一行按钮点击事件
- (void)firstLineBtnAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100:{
            
            CaiWuDuiZhangController *caiWuVC = [[CaiWuDuiZhangController alloc] init];
            [self.navigationController pushViewController:caiWuVC animated:YES];
            
        }
            break;
        case 101: {
            DrawMoneyController *drawVC = [[DrawMoneyController alloc] init];
            [self.navigationController pushViewController:drawVC animated:YES];
        }
            break;
        case 102:{
            ShopInformationController *shopVC = [[ShopInformationController alloc] init];
            [self.navigationController pushViewController:shopVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark -第二行按钮点击事件
- (void)secondLineBtnAction:(UIButton *)sender {
    switch (sender.tag) {
        case 200:{
            ManagerProductController *managerVC = [[ManagerProductController alloc] init];
            [self.navigationController pushViewController:managerVC animated:YES];
        }
            break;
        case 201: {
            UserCommentController *commentVC = [[UserCommentController alloc] init];
            [self.navigationController pushViewController:commentVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark -第三行按钮点击事件
- (void)thirdLineBtnAction:(UIButton *)sender {
    LoginAndRegistViewController *loginVC = [[LoginAndRegistViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES]
    ;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
