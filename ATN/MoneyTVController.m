//
//  MoneyTVController.m
//  ATN
//
//  Created by 王赛 on 16/4/22.
//  Copyright © 2016年 王赛. All rights reserved.
//


#import "MoneyTVController.h"
#import "WSCommon.h"
#import "ShowMoneyTVCell.h"


@interface MoneyTVController ()<UITableViewDataSource,UITableViewDelegate>
// 活动列表数据  假数据
@property (nonatomic, strong) NSMutableArray *teseData;


@end

@implementation MoneyTVController


-(NSMutableArray *)teseData
{
    if (_teseData == nil) {
        self.teseData = [[NSMutableArray alloc] init];
    }
    return _teseData;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.navigationItem.title = @"聚宝盆";
    
    [self setNvagationBar];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----setNavgationBar
-(void)setNvagationBar
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-50, 10, 30, 30)];
//    btn.imageView.image = [UIImage imageNamed:@"icon_message"];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(DirectionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = right;
}

-(void)DirectionClick:(UIButton *)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *directionvc = [sb instantiateViewControllerWithIdentifier:@"DirectionVC"];
    [self.navigationController pushViewController:directionvc animated:YES];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

