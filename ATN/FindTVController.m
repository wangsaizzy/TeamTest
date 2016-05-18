//
//  FindTVController.m
//  ATN
//
//  Created by 王赛 on 16/5/12.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "ShopTVCell.h"
#import "ShoplistModel.h"
//#import "ShopDetailViewController.h"
#import "ShopDetailVC.h"

#import "FindTVController.h"
#import "WSCommon.h"

@interface FindTVController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *shopListarray;

@end

@implementation FindTVController

-(NSMutableArray *)shopListarray
{

    if (_shopListarray ==nil) {
       
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ShopList" ofType:@"plist"];
        NSArray *models = [NSArray arrayWithContentsOfFile:path];
        _shopListarray = [NSMutableArray array];

        for (NSDictionary *dict in models) {
        ShoplistModel *shoplist = [ShoplistModel shoplistDict:dict];
        [_shopListarray addObject:shoplist];

        }

    }
return _shopListarray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
     //设置数据源和代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
//    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"ShopTVCell" bundle:nil] forCellReuseIdentifier:@"ShopTVCell"];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    _tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenheight-200);
}

#pragma mark ----TableView data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shopListarray.count;
//    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShopTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopTVCell" ];
    
    
    
    /**
     *  配置cell
     */
    ShoplistModel *model = _shopListarray[indexPath.row];
    
    cell.shoplistmodel = model;
    
  
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell.textLabel.text = _content;
    return cell;
}
#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


#pragma mark - 选中行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   
    ShopDetailVC * vc = [sb instantiateViewControllerWithIdentifier:@"ShopDetailVC"];
    
    //    ShoplistModel * model = self.dataArray[indexPath.row];
    //    vc.shopId = model.shopId;
    //    vc.indentify = @"3";
    [self.navigationController pushViewController:vc animated:YES];
    //
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
