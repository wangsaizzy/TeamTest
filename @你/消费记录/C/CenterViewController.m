//
//  RootViewController.m
//  vipshop
//
//  Created by Mind is important  on 15/12/12.
//  Copyright © 2015年 iovo. All rights reserved.
//

#import "CenterViewController.h"
#import "UIBarButtonItem+BarButton.h"
#import "MYButton.h"
#import "FinishViewCell.h"
#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width

const CGFloat kButtonWidthArr [2] = {60,60};

@interface CenterViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate>


@property (nonatomic,strong) UITableView *finishTableView;
@property (nonatomic,strong) UITableView *overseasTableView;

@end

@implementation CenterViewController
{
    UIScrollView *ktitleScrollView;
    NSMutableArray *kTitleButtonFrame;
    UIView *ktitleTagView;
    MYButton *kcurrentButton;
}
#pragma mark -
#pragma mark - setUpTableView
- (UITableView *)finishTableView
{
    return [self tableView:_finishTableView MultipleForScreen:0];
}
- (UITableView *)overseasTableView
{
    return [self tableView:_overseasTableView MultipleForScreen:1];
    
}
- (UITableView*)tableView:(UITableView*)tableView MultipleForScreen:(int)n
{
    if (!tableView) {
        tableView = [[UITableView alloc]initWithFrame:CGRectMake(screenW * n, 0, screenW, screenH)];
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[FinishViewCell class] forCellReuseIdentifier:@"FinishViewCell"];
    }
    return tableView;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
    self.isPush = NO;
    if (self.indexOfBtn == 0) {
       [kTitleButtonFrame[0] setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];

    }
    [kTitleButtonFrame[0] setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
    kcurrentButton = kTitleButtonFrame[self.indexOfBtn];
    NSNumber *number = [NSNumber numberWithInteger:self.indexOfBtn];
    int page = [number intValue];
    [self didSelectPage:page];
    self.mainScrollView.contentOffset = CGPointMake(screenW * page, 0);
    
    
   }
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消费记录";
    
    [self setupscrollView];
    [self titleScrollViewAddButton];
    self.finishTableView.delegate = self;
    self.overseasTableView.delegate = self;
    [self.mainScrollView addSubview:self.finishTableView];
    [self.mainScrollView addSubview:self.overseasTableView];
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
     [kTitleButtonFrame[0] setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
    if ([[scrollView class]isSubclassOfClass:[UITableView class]]) return;
        int page = scrollView.contentOffset.x / screenW;
        [self didSelectPage:page];
}

- (void)didSelectPage:(int)page
{
    switch (page) {
        case 0: ktitleTagView.frame = [self titleTagViewFrameTag:0]; break;
        case 1: ktitleTagView.frame = [self titleTagViewFrameTag:1]; break;
        
        default:
            break;
    }
}
- (CGRect)titleTagViewFrameTag:(int)tag
{
    
    kcurrentButton.selected = NO;
    MYButton *button = kTitleButtonFrame[tag];
    button.selected = YES;
    
    kcurrentButton = button;
    CGRect rect = button.frame;
    return CGRectMake(rect.origin.x - 7.5 * kMulriple, 40 * kHMulriple, button.bounds.size.width + 15 * kMulriple, 4 * kHMulriple);
}
#pragma mark -
#pragma mark - TitleScrollViewAddButton
- (void)titleScrollViewAddButton
{
    kTitleButtonFrame = [NSMutableArray array];
    NSArray *titleArr = @[@"完 成",@"预 约"];
    CGFloat space = 25 * kMulriple;
    CGFloat titleButtonH = 44 * kHMulriple;
    CGFloat titleButtonX = 30 * kMulriple;
    for (int i = 0; i < 2; i++) {
        MYButton *button = [MYButton buttonWithType:UIButtonTypeCustom];
        
        
            button.frame = CGRectMake(titleButtonX, 0 , kButtonWidthArr[i] * kMulriple, titleButtonH);
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            [button setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:18
                                      ];
        button.tag = i;
        
        titleButtonX += kButtonWidthArr[i] + space;
        
        [ktitleScrollView addSubview:button];
        [kTitleButtonFrame addObject:button];
        [button addTarget:self action:@selector(checkTitleButtonSelectorScrollPage:) forControlEvents:UIControlEventTouchDown];
        }
}
- (void)checkTitleButtonSelectorScrollPage:(MYButton*)button
{
    [kTitleButtonFrame[0] setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
    int page = (int)button.tag;
    [self didSelectPage:page];
    self.mainScrollView.contentOffset = CGPointMake(screenW * page, 0);
}
#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellID = @"crazedTableView";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        
//    }
    FinishViewCell *finishCell = [tableView dequeueReusableCellWithIdentifier:@"FinishViewCell" forIndexPath:indexPath];
    
    
    finishCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return finishCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80 * kHMulriple;
}
#pragma mark -
#pragma mark - setupScrollView
- (void)setupscrollView
{
    ktitleScrollView = [self setupScrollViewFrame:CGRectMake(0, 0,screenW + 90 * kMulriple, 44 * kHMulriple) contentSize:CGSizeMake(screenW + 30 * kMulriple, 0) pagingEnabled:NO backgroundColol:[UIColor whiteColor]];
    self.mainScrollView = [self setupScrollViewFrame:CGRectMake(0, 44 * kHMulriple, screenW, screenH) contentSize:CGSizeMake(screenW * 2* kMulriple, 0) pagingEnabled:YES backgroundColol:[UIColor redColor]];
    [self addTitleScrollViewTagView];
    self.mainScrollView.delegate = self;
    ktitleScrollView.delegate = self;
    self.mainScrollView.bounces = NO;
    ktitleScrollView.bounces =NO;
    kcurrentButton.selected = YES;
    [self.view addSubview:ktitleScrollView];
    [self.view addSubview:self.mainScrollView];
    [ktitleScrollView addSubview:ktitleTagView];
}
- (void)addTitleScrollViewTagView
{
    ktitleTagView = [[UIView alloc]initWithFrame:CGRectMake(15 * kMulriple, 40 * kHMulriple, 30 * kMulriple, 4 * kHMulriple)];
    ktitleTagView.backgroundColor = [UIColor orangeColor];
}
- (UIScrollView*)setupScrollViewFrame:(CGRect)frame contentSize:(CGSize)contentSize pagingEnabled:(BOOL)pagingEnabled backgroundColol:(UIColor*)color
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.pagingEnabled = pagingEnabled;
    scrollView.backgroundColor = color;
    scrollView.contentSize = contentSize;
    return scrollView;
}


@end
