//
//  ShopDetailViewController.m
//  @你
//
//  Created by 王赛 on 16/5/3.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "WSCommon.h"

@interface ShopDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)setupTable{

    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenheight)];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
    
}

-(void)setupdata
{
    
    
    
}

#pragma mark - tableview data source





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
