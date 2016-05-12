//
//  shopPageTVController.m
//  @你
//
//  Created by 王赛 on 16/4/28.
//  Copyright © 2016年 王赛. All rights reserved.


//   ========================-------好店---------=================

#import "shopPageTVController.h"
#import "ShopTVCell.h"
#import "ShoplistModel.h"

@interface shopPageTVController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic , strong) NSMutableArray *goodshopArray;//好店数据

@end

@implementation shopPageTVController

-(NSMutableArray *)goodshopArray
{
    if (_goodshopArray ==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ShopList" ofType:@"plist"];
        NSArray *models = [NSArray arrayWithContentsOfFile:path];
        _goodshopArray = [NSMutableArray array];
        for (NSDictionary *dict in models) {
            ShoplistModel *shoplist = [ShoplistModel shoplistDict:dict];
            [_goodshopArray addObject:shoplist];
        }
    }
    return _goodshopArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setupSubviews];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupSubviews{

    //    //注册cell
 //   [self registerNib:[UINib nibWithNibName:@"ShopTVCell" bundle:nil] forCellReuseIdentifier:@"ShopTVCell"];
}

#pragma mark - Table view data source
//zu
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 10;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
//    return self.goodshopArray.count;
}
static NSString * const Goodspagecell = @"goodsPageTVController";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    ShopTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopTVCell" ];
//    
//    
//    
//    /**
//     *  配置cell
//     */
//    ShoplistModel *model = _goodshopArray[indexPath.row];
//    
//    cell.shoplistmodel = model;
//    
//    
//    return cell;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Goodspagecell ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Goodspagecell];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@--肯德基--%zd",self.title,indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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
