//
//  CaiWuDuiZhangController.m
//  @你
//
//  Created by 吴明飞 on 16/4/27.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "CaiWuDuiZhangController.h"
#import "CaiWuDuiZhangCell.h"
#import "ListDetailController.h"

@interface CaiWuDuiZhangController ()<UITableViewDataSource, UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation CaiWuDuiZhangController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    
    self.title = @"财务对账";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //注册cell
    [_tableView registerClass:[CaiWuDuiZhangCell class] forCellReuseIdentifier:@"CaiWuDuiZhangCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100 * kHMulriple;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CaiWuDuiZhangCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CaiWuDuiZhangCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ListDetailController *listVC = [[ListDetailController alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
}

@end
