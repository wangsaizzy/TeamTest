//
//  AddShoperController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/29.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "AddShoperController.h"
#import "AddShoperView.h"
@interface AddShoperController ()

@end

@implementation AddShoperController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    AddShoperView *addView = [[AddShoperView alloc] initWithFrame:self.view.bounds];
    self.view = addView;
    
    //选择店铺种类按钮点击事件
    [addView.chooseCategoryBtn addTarget:self action:@selector(chooseCategoryBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //选择店铺区域按钮点击事件
    [addView.chooseCategoryBtn addTarget:self action:@selector(chooseAddressBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //我要入驻按钮点击事件
    [addView.addShopBtn addTarget:self action:@selector(addShopBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -选择店铺种类按钮点击事件
- (void)chooseCategoryBtnAction:(UIButton *)sender {
    
}

#pragma mark -选择店铺区域按钮点击事件
- (void)chooseAddressBtnAction:(UIButton *)sender {
    
}

#pragma mark -我要入驻按钮点击事件
- (void)addShopBtnAction:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
