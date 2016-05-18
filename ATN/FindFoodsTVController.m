//
//  FindFoodsTVController.m
//  ATN
//
//  Created by 王赛 on 16/5/13.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "FoodslistModel.h"
#import "FoodsTVCell.h"

#import "FindFoodsTVController.h"
//#import "ShopDetailViewController.h"
#import "ShopDetailVC.h"
#import "WSCommon.h"
@interface FindFoodsTVController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic , strong) UITableView *tableView;

@property(nonatomic , strong) NSMutableArray *foodListarray;

@end

@implementation FindFoodsTVController

-(NSMutableArray *) foodListarray
{
    if (_foodListarray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"FoodList" ofType:@"plist"];
        NSArray *model = [NSArray arrayWithContentsOfFile:path];
        _foodListarray = [NSMutableArray array];
        
        for (NSDictionary *dict in model) {
            FoodslistModel *foodlist = [FoodslistModel foodlistDict:dict];
            [_foodListarray addObject:foodlist];
        }
    }
    
    return _foodListarray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
      //设置数据源和代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    

    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"FoodsTVCell" bundle:nil] forCellReuseIdentifier:@"FoodsTVCell"];
    
}

-(void)viewWillLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //================-------这边frame有问题----=============//
    
    _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenheight-200);
    
}

#pragma mark --- tableView data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodListarray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodsTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodsTVCell"];
    
    /**
     *   配置Cell
     */
    FoodslistModel *model = _foodListarray[indexPath.row];
    
    cell.foodlistmodel = model;
    
    return cell;
}

#pragma mark --行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark --选中行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ShopDetailVC *vc = [sb instantiateViewControllerWithIdentifier:@"ShopDetailVC"];
    [self.navigationController pushViewController:vc animated:YES];
    
}



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
