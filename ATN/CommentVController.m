
//  CommentVController.m
//  ATN
//
//  Created by 王赛 on 16/5/15.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "CommentVController.h"

#import "ShoplistModel.h"
#import "CommentTVCell.h"
#import "WSCommon.h"
#import "NSString+size.h"//计算高度

@interface CommentVController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *tableView ;
@property (nonatomic ,strong) NSMutableArray *commentListarray;

//@property (nonatomic, strong)NSArray *sourceData;//评论数组

@end

@implementation CommentVController

-(NSMutableArray *)commentListarray
{
    if (_commentListarray == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"CommentList" ofType:@"plist"];
        NSArray *model = [NSArray arrayWithContentsOfFile:path];
        
        _commentListarray = [NSMutableArray array];
        
        for (NSDictionary *dict in model){
            ShoplistModel *commentlist = [ShoplistModel shoplistDict:dict];
            [_commentListarray addObject:commentlist];
            
        }
    }
    return _commentListarray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    //设置数据源和代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
     [self.tableView registerNib:[UINib nibWithNibName:@"CommentTVCell" bundle:nil] forCellReuseIdentifier:@"CommentTVCell"];
    
//    self.sourceData = @[@"qazedc sdf sdfosnf0 sdflsjfd sdfsdl sdfsdf ", @"qazedc sdf sdfosnf0 sdflsjfd sdfsdl sdfsdf qazedc sdf sdfosnf0 sdflsjfd sdfsdl sdfsdf qazedc sdf sdfosnf0 sdflsjfd sdfsdl sdfsdf qazedc sdf sdfosnf0 sdflsjfd sdfsdl sdfsdf ",@"sdf \n sdfsd\n\n sdfsdf", @"ad asdf asdfreng asfd ", @"kele"];
}

-(void)viewWillLayoutSubviews
{
    [super viewDidLayoutSubviews];
   
     //================-------这边frame有问题----=============//
    _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenheight-404);
}

#pragma mark - tableview data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.commentListarray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentTVCell"];
    /**
     *  配置cell
     */
    ShoplistModel *model = _commentListarray[indexPath.row];
    
    cell.shopCommentmodel = model;
    return cell;
}

#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"====height");
//    //将要显示的文字
//    NSString *text = self.sourceData[indexPath.row % self.sourceData.count];
//    
//    //计算出label的宽度，左右两边预留8个像素
//    CGFloat width = [[UIScreen mainScreen] bounds].size.width - 16;
//    
//    CGSize resultSize = [text sizeWithFont:[UIFont systemFontOfSize:17] Size:CGSizeMake(width, MAXFLOAT)];
//    //cell的整体高度
//    return resultSize.height + 23 ;
    return 150;
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
