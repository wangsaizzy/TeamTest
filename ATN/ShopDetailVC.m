//
//  ShopDetailVC.m
//  @你
//
//  Created by 王赛 on 16/5/15.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "ShopDetailVC.h"

#import "CommentVController.h"
#import "FindFoodsTVController.h"
#import "WSCommon.h"



@interface ShopDetailVC ()<LSYViewPagerVCDataSource,LSYViewPagerVCDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSArray *titleArray;

@property (nonatomic ,strong) UIView *topBackView;//顶部大backView
@property (nonatomic ,strong) UITableView *topTableView;//顶部tableView


@end

@implementation ShopDetailVC

-(void)loadView
{
    [super loadView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"店铺xxx";
    _titleArray = @[@"商品预览",@"店铺评价"];
    self.delegate = self;
    self.dataSource = self;
    
    //    self.tabBarController.tabBar.hidden = YES;
    [self reload];
    //    [self setTabBarHidden:YES];
    
}

//- (void)setTabBarHidden:(BOOL)hidden
//{
//    UIView *tab = self.tabBarController.view;
//
//    if ([tab.subviews count] < 1) {
//        return;
//    }
//    UIView *view;
//
//    if ([[tab.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]]) {
//        view = [tab.subviews objectAtIndex:1];
//    } else {
//        view = [tab.subviews objectAtIndex:0];
//    }
//
//    if (hidden) {
//        view.frame = tab.bounds;
//    } else {
//        view.frame = CGRectMake(tab.bounds.origin.x, tab.bounds.origin.y, tab.bounds.size.width, tab.bounds.size.height);
//    }
//    self.view.frame = view.frame;
//    self.tabBarController.tabBar.hidden = hidden;
//}

-(UIView *)topBackView
{
    
    if (!_topBackView) {
        
        _topBackView  = [[UIView alloc] init];
        _topBackView.backgroundColor = [UIColor colorWithRed: 120/255.0f green:210/255.0f blue:249/255.0f alpha:1];
        
        //        _topTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
        //
        //        _topTableView.delegate = self;
        //
        //        _topTableView.dataSource = self;
        //
        //        [_topBackView addSubview:_topTableView];
        
        
        UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 200, 40)];
        la.text = @"等会再说这是什么东西";
        la.textColor = [UIColor redColor];
        [_topBackView addSubview:la];
        
    }
    return _topBackView;
}

#pragma mark - topTableView  delegate && Data source






#pragma mark --View Paper Data Source
/**
 *  设置返回需要滑动的控制器数量
 */
-(NSInteger)numberOfViewControllersInViewPager:(LSYViewPagerVC *)viewPager
{
    return 2;
}
/**
 *  用来设置当前索引下返回的控制器
 */

-(UIViewController *)viewPager:(LSYViewPagerVC *)viewPager indexOfViewControllers:(NSInteger)index
{
    if (index == 0) {
#warning Bug
        /**
         * 先用findfoodstvcontroller代替试效果此处有Bug ,可无限循环点击进入下一级界面
         */
        FindFoodsTVController *foodstableVC = [[FindFoodsTVController alloc] init];
        foodstableVC.contentfoods = _titleArray[index];
        return foodstableVC;
        
    }else {
        
        CommentVController *commenttableViewVC = [[CommentVController alloc] init];
        commenttableViewVC.contentcomment = _titleArray[index];
        
        return commenttableViewVC;
        
        
    }
    
}

-(UIView *)headerViewForInViewPager:(LSYViewPagerVC *)viewPager
{
    return self.topBackView;
}
/**
 设置头部视图的高度
 */
-(CGFloat)heightForHeaderOfViewPager:(LSYViewPagerVC *)viewPager
{
    return 300;
}
-(CGFloat)heightForTitleOfViewPager:(LSYViewPagerVC *)viewPager
{
    return 40;
}
-(NSString *)viewPager:(LSYViewPagerVC *)viewPager titleWithIndexOfViewControllers:(NSInteger)index
{
    return self.titleArray[index];
}


#pragma View Pager Delegate
-(void)viewPagerViewController:(LSYViewPagerVC *)viewPager willScrollerWithCurrentViewController:(UIViewController *)ViewController
{
    
}
-(void)viewPagerViewController:(LSYViewPagerVC *)viewPager didFinishScrollWithCurrentViewController:(UIViewController *)viewController
{
    
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