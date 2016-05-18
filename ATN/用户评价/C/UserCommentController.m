//
//  UserCommentController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/31.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "UserCommentController.h"
#import "UserCommentCell.h"

@interface UserCommentController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation UserCommentController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.view.backgroundColor = RGB(238, 238, 238);
    self.title = @"商品管理";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWight, 280) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UserCommentCell class] forCellReuseIdentifier:@"UserCommentCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserCommentCell *userCell = [tableView dequeueReusableCellWithIdentifier:@"UserCommentCell" forIndexPath:indexPath];
    userCell.userNameLabel.text = @"蛇眼";
    userCell.standardLabel.text = @"八公斤";
    userCell.timeLabel.text = @"3-31";
    userCell.contentLabel.text = @"王健林的减肥快点击付款的积分卡积分开发开放接口的积分卡积分开放接口的减肥快点击付款的房价肯定发打开就疯狂点击付款就疯狂减肥咖啡就看到就分开交罚款大家疯狂点击付款的减肥减肥快点击开房间开疯狂的减肥看到减肥减肥咖啡就看见的空间。";
    [userCell.contentLabel setNumberOfLines:0];
    CGSize boudingSize = CGSizeMake(335, 300);
    CGSize requiredSize = CGSizeZero;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14 * kMulriple]};
    requiredSize = [userCell.contentLabel.text boundingRectWithSize:boudingSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    userCell.contentLabel.frame = CGRectMake(20 * kMulriple, 70 * kHMulriple, 335 * kMulriple, requiredSize.height);
    
    userCell.commentFirstPicture.frame = CGRectMake(20 * kMulriple, 90 * kHMulriple + requiredSize.height, 70 * kMulriple, 70 * kHMulriple);
    
    userCell.commentSecondPicture.frame = CGRectMake(100 * kMulriple, 90 * kHMulriple + requiredSize.height, 70 * kMulriple, 70 * kHMulriple);
    
    userCell.commentThirdPicture.frame = CGRectMake(180 * kMulriple, 90 * kHMulriple + requiredSize.height, 70 * kMulriple, 70 * kHMulriple);
    //UserCommentModel *commentModel = [[UserCommentModel alloc] init];
    return userCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 320;
    
    
}

@end
