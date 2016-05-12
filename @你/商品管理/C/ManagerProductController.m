//
//  ManagerProductController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/31.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "ManagerProductController.h"
#import "AddGoodsController.h"
#import "ManagerProductCell.h"
#import "GoodsModel.h"
@interface ManagerProductController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;//数据源

@end

@implementation ManagerProductController

{
    BOOL _isResume;//恢复售卖
    BOOL _isOutOfStock;//缺货下架
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.dataSourceArr = [NSMutableArray arrayWithCapacity:6];
    //自定义试图用
    [self setupViews];
    //请求数据
    [self requestData];
}

- (void)setupViews {
    self.view.backgroundColor = RGB(238, 238, 238);
    self.title = @"商品管理";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    /*
     
     添加商品按钮
     
     */
    
    UIButton *addGoodsBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    addGoodsBtn.frame = CGRectMake(275 * kMulriple, 457 * kHMulriple, 80 * kMulriple, 90 * kHMulriple);
    UIImageView *addImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2商家-添加商品"]];
    [addGoodsBtn addSubview:addImage];
    addImage.centerX = addGoodsBtn.width / 2;
    addImage.centerY = 80  * kHMulriple / 2;
    UILabel *addLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * kMulriple, addImage.frame.size.height + 7, addGoodsBtn.frame.size.width, 12)];
    addLabel.font = [UIFont systemFontOfSize:14];
    addLabel.textAlignment = NSTextAlignmentCenter;
    addLabel.text = @"添加商品";
    addLabel.centerX = addGoodsBtn.width / 2 + 7 * kMulriple;
    addLabel.centerY = 140 * kHMulriple / 2;
    [addGoodsBtn addSubview:addLabel];
    
    [addGoodsBtn addTarget:self action:@selector(addGoodsBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addGoodsBtn];
    
    //注册cell
    [self.tableView registerClass:[ManagerProductCell class] forCellReuseIdentifier:@"ManagerProductCell"];
    
    //[self.tableView registerClass:[ManagerProductResumeCell class] forCellReuseIdentifier:@"ManagerProductResumeCell"];
}

//GET异步请求
- (void)requestData {
    
    NSString *urlStr = @"http://123.56.77.171/app/shop/product";
    NSString *newStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:newStr];
    [SVProgressHUD show];
   NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:url];
    NSString *value = [NSString stringWithFormat:@"%@", [UserModel defaultModel].user.token];
    [request addValue:value forHTTPHeaderField:@"Authorization"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        
        [self parseDataWithData:data];
        [SVProgressHUD dismiss];
        
    }];
    
}

//解析数据 添加到数据源
- (void)parseDataWithData:(NSData *)data{
    //使用系统JSON解析方式进行解析
    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", dict);
    NSDictionary *pageDic = dict[@"page"];
    NSArray *contentArr = pageDic[@"content"];
    for (NSDictionary *dic in contentArr) {
        GoodsModel *model = [[GoodsModel alloc] initWithDic:dic];
        
        
        [self.dataSourceArr addObject:model];
    }
   
    [self.tableView reloadData];
}

//添加商品按钮方法
- (void)addGoodsBtnAction:(UIButton *)sender {
    
    AddGoodsController *goodsVC = [[AddGoodsController alloc] init];
    [self.navigationController pushViewController:goodsVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     NSLog(@"%ld", self.dataSourceArr.count);
    return self.dataSourceArr.count;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    }
    
    GoodsModel *model = self.dataSourceArr[indexPath.row];
    NSInteger goodsNum = [model.number integerValue];
    ManagerProductCell *managerCell = [tableView dequeueReusableCellWithIdentifier:@"ManagerProductCell" forIndexPath:indexPath];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://123.56.77.171/app%@", model.url]];
    [managerCell.productImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    [managerCell.editBtn addTarget:self action:@selector(editBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    managerCell.productNameLabel.text = model.name;
    managerCell.productPriceLabel.text = @"18.00";

    
    
   [managerCell.productStockBtn addTarget:self action:@selector(outofStockAction:) forControlEvents:UIControlEventTouchUpInside];
    [managerCell.productResumeBtn addTarget:self action:@selector(resumeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    if (goodsNum > 0) {
       
        
        managerCell.productStockBtn.hidden = YES;
        managerCell.productResumeBtn.tag = [model.id integerValue] + 199;
    
    }
    if (model.number == NULL) {
    
        
        managerCell.productResumeBtn.hidden = YES;
        managerCell.productStockBtn.tag = [model.id integerValue] + 199;
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 140 * kHMulriple;

}


//编辑按钮方法
- (void)editBtnAction:(UIButton *)sender {
    
    AddGoodsController *goodsVC = [[AddGoodsController alloc] init];

    UITableViewCell *cell = (UITableViewCell *)[sender superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    goodsVC.model = self.dataSourceArr[indexPath.row];
    
    [self.navigationController pushViewController:goodsVC animated:YES];
    
}


//发布商品
- (void)resumeAction:(UIButton *)sender {
    
    ManagerProductCell *cell = (ManagerProductCell *)[sender superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSLog(@"%ld", indexPath.row);
    GoodsModel *model = self.dataSourceArr[sender.tag - 200];
    NSString *urlString = [NSString stringWithFormat:@"http://123.56.77.171/app/shop/product/%@/publish", model.id];
    
    NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"PATCH" URLString:urlStr parameters:nil error:nil];
    NSString *value = [NSString stringWithFormat:@"%@", [UserModel defaultModel].user.token];
    [request addValue:value forHTTPHeaderField:@"Authorization"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    WS(weakself);
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        [weakself parseResumeData:data];
        
    }];
    [SVProgressHUD showSuccessWithStatus:@"发布成功"];
    cell.productResumeBtn.hidden = YES;
    cell.productStockBtn.hidden = NO;
    [self.tableView reloadData];
}

//商品下架
- (void)outofStockAction:(UIButton *)sender {
    
    ManagerProductCell *cell = (ManagerProductCell *)[sender superview];
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
//    NSLog(@"%ld", indexPath.row);
    GoodsModel *model = self.dataSourceArr[sender.tag - 200];
    NSString *urlString = [NSString stringWithFormat:@"http://123.56.77.171/app/shop/product/%@/unpublish", model.id];
    
    NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"PATCH" URLString:urlStr parameters:nil error:nil];
    NSString *value = [NSString stringWithFormat:@"%@", [UserModel defaultModel].user.token];
    
    [request addValue:value forHTTPHeaderField:@"Authorization"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    WS(weakself);
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        [weakself parseData:data];
        
    }];
    
    [SVProgressHUD showSuccessWithStatus:@"下架成功"];
    cell.productStockBtn.hidden = YES;
    cell.productResumeBtn.hidden = NO;
    [self.tableView reloadData];
    
}

- (void)parseData:(NSData *)data {
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if (dict) {
        NSLog(@"%@", dict);
        
        
    } else {
        
        
    }
}

- (void)parseResumeData:(NSData *)data {
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if (dict) {
        NSLog(@"%@", dict);
        
        
    } else {
        
        
    }
    
}

@end
