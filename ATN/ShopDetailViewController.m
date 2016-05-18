//
//  ShopDetailViewController.m
//  ATN
//
//  Created by 王赛 on 16/5/3.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "ShopDetailViewController.h"


#import "WSCommon.h"

@interface ShopDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    [self setupTable];
}

-(void)setupTable{
    
   
//    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenheight)];
//    [self.view addSubview:tableview];
//    tableview.delegate = self;
//    tableview.dataSource = self;
  
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
   [self.view addSubview:_tableView];
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenheight);
    
}

-(void)setupdata
{
    
    
    
}
//
#pragma mark - tableview data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0 ) {
        return 4;
    } else {
        return 1;
    }
}

#pragma mark - 精确tableView 
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row ==0) {
        UITableViewCell *shopheadimgcell = [[UITableViewCell alloc]init];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        imgView.image = [UIImage imageNamed:@"em_104"];
        
        [shopheadimgcell addSubview:imgView];
        return shopheadimgcell;
        
    } else if(indexPath.section == 0 &&indexPath.row == 1) {
        
        UITableViewCell *adresscell = [[UITableViewCell alloc] init];
        
        
        UILabel *shopadress = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        shopadress.text = @"北京市海淀区北清路88号";
        [adresscell addSubview:shopadress];
        
        return adresscell;
        
    }
    
    return nil;
}
/**
 *  设置高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0&&indexPath.row == 0) {
        //图高度
        return 60;
    }
    else if (indexPath.section == 0&&indexPath.row == 1 ){
        //地址高度
        return 60;
    }
    else if (indexPath.section == 0&&indexPath.row == 2 ){
        //电话高度
        return 60;
    }else if (indexPath.section == 0 &&indexPath.row == 3){
        
        return 100;
        
    }else if (indexPath.section == 1){
        
        return 100;
    }else if (indexPath.section == 2){
        
        return 400;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }
    
    return 1;
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
