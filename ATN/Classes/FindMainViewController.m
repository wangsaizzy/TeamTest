//
//  FindMainViewController.m
//  ATN
//
//  Created by 王赛 on 16/5/12.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "FindMainViewController.h"
#import "FindTVController.h"
#import "FindFoodsTVController.h"
#import "WSCommon.h"

@interface FindMainViewController ()<LSYViewPagerVCDataSource,LSYViewPagerVCDelegate>

@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) UIView *headerView;

@end

@implementation FindMainViewController
-(void)loadView
{
    [super loadView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"发现";
    _titleArray = @[@"好店",@"好物"];
    self.delegate = self;
    self.dataSource = self;
    [self reload];

}

-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor colorWithRed:120/255.0f green:210/255.0f blue:249/255.0f alpha:1];
        
      
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 200, 40)];
        label.text = @"我是广告";
        label.textColor = [UIColor redColor];
        UIImageView *imgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        imgview.image = [UIImage imageNamed:@"em_107"];

        [_headerView addSubview:imgview];
        [_headerView addSubview:label];
    }
    return _headerView;
}
#pragma View Pager Data Source
/**
 设置返回需要滑动的控制器数量
 */
-(NSInteger)numberOfViewControllersInViewPager:(LSYViewPagerVC *)viewPager
{
    return 2;
}

/**
 用来设置当前索引下返回的控制器
 */
-(UIViewController *)viewPager:(LSYViewPagerVC *)viewPager indexOfViewControllers:(NSInteger)index
{
 
    if (index == 0) {
        FindTVController *tableViewVC = [[FindTVController alloc] init];
            tableViewVC.content = _titleArray[index];
            return tableViewVC;
        
    } else {
    
        FindFoodsTVController *foodstableViewVC = [[FindFoodsTVController alloc]init];
        foodstableViewVC.contentfoods = _titleArray[index];
        return foodstableViewVC;
        
    }
    
//    FindTVController *tableViewVC = [[FindTVController alloc] init];
//    tableViewVC.content = _titleArray[index];
//    return tableViewVC;
}
-(UIView *)headerViewForInViewPager:(LSYViewPagerVC *)viewPager
{
    return self.headerView;
}
-(CGFloat)heightForHeaderOfViewPager:(LSYViewPagerVC *)viewPager
{
    return 100;
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
