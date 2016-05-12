//
//  TodayListController.m
//  @你
//
//  Created by 吴明飞 on 16/4/28.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "TodayListController.h"
#import "ListDetailController.h"
#import "UIBarButtonItem+BarButton.h"
#import "MYButton.h"
#import "FinishViewCell.h"
#import "AppointmentCell.h"
const CGFloat buttonWidthArr [2] = {60, 80};

@interface TodayListController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *finishTableView;
@property (nonatomic, strong) UITableView *appointmentTableView;

@end

@implementation TodayListController
{
    UIScrollView *_titleScrollView;
    NSMutableArray *_titleBtnFrame;
    UIView *_titleTagView;
    MYButton *_currentBtn;
}


#pragma mark -setupTableView
- (UITableView *)tableView:(UITableView *)tableView MultipleForScreen:(int)n {
    
    if (!tableView) {
        tableView = [[UITableView alloc] initWithFrame:CGRectMake(kWight * n, 0, kWight, kHeight)];
        tableView.delegate = self;
        tableView.dataSource = self;
        
        
        
    }
    return tableView;
    
}

- (UITableView *)finishTableView {
    
    [_finishTableView registerClass:[FinishViewCell class] forCellReuseIdentifier:@"FinishViewCell"];
    return [self tableView:_finishTableView MultipleForScreen:0];
    
}

- (UITableView *)appointmentTableView {
    
    [_appointmentTableView registerClass:[AppointmentCell class] forCellReuseIdentifier:@"AppointmentCell"];
    return [self tableView:_appointmentTableView MultipleForScreen:1];
    
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.isPush = NO;
    
    if (self.indexOfBtn == 0) {
        [_titleBtnFrame[1] setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
    }
    [_titleBtnFrame[1] setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
    
    _currentBtn = _titleBtnFrame[self.indexOfBtn];
    
    NSNumber *number = [NSNumber numberWithInteger:self.indexOfBtn];
    
    int page = [number intValue];
    
    [self didSelectPage:page];
    
    self.mainScrollView.contentOffset = CGPointMake(kWight * page, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"今日订单";
    
    //最上端滑动视图
    [self setupscrollView];
    
    //最上端滑动视图按钮
    [self titleScrollViewAddBtn];
    self.finishTableView.delegate = self;
    self.finishTableView.dataSource = self;
    self.appointmentTableView.delegate = self;
    self.appointmentTableView.dataSource = self;
    
    [self.mainScrollView addSubview:self.finishTableView];
    [self.mainScrollView addSubview:self.appointmentTableView];
    
    
    
}

#pragma mark -setupscrollView
- (void)setupscrollView {
    
    _titleScrollView = [self setupScrollViewFrame:CGRectMake(0, 0, kWight + 90 * kMulriple, 44 * kHMulriple) contentSize:CGSizeMake(kWight + 30 * kMulriple, 0) pagingEnabled:NO backgroundColor:[UIColor whiteColor]];
    self.mainScrollView = [self setupScrollViewFrame:CGRectMake(0, 44 * kHMulriple, kWight, kHeight) contentSize:CGSizeMake(kWight * 2, 0) pagingEnabled:YES backgroundColor:[UIColor whiteColor]];
    
    [self addTitleScrollViewTagView];
    self.mainScrollView.delegate = self;
    _titleScrollView.delegate = self;
    self.mainScrollView.bounces = NO;
    _titleScrollView.bounces = NO;
    _currentBtn.selected = YES;
    
    [self.view addSubview:_titleScrollView];
    [self.view addSubview:self.mainScrollView];
    [_titleScrollView addSubview:_titleTagView];
    
}

- (UIScrollView *)setupScrollViewFrame:(CGRect)frame contentSize:(CGSize)contentSize pagingEnabled:(BOOL)pagingEnabled backgroundColor:(UIColor *)backgroundColor {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.pagingEnabled = pagingEnabled;
    scrollView.backgroundColor = backgroundColor;
    scrollView.contentSize = contentSize;
    return scrollView;
}


- (void)addTitleScrollViewTagView {
    
    _titleTagView = [[UIView alloc] initWithFrame:CGRectMake(15 * kMulriple, 40 * kHMulriple, 30 * kMulriple, 4 * kHMulriple)];
    _titleTagView.backgroundColor = [UIColor orangeColor];
    
}


#pragma mark -titleScrollViewAddBtn
- (void)titleScrollViewAddBtn {
    
    _titleBtnFrame = [NSMutableArray array];
    NSArray *titleArr = @[@"完成", @"预约(15)"];
    CGFloat space = 25 * kMulriple;
    CGFloat titleBtnWidth = 44 * kMulriple;
    CGFloat titleBtnHeight = 30 * kHMulriple;
    for (int i = 0; i < 2; i++) {
    
        MYButton *titleBtn = [MYButton buttonWithType:UIButtonTypeCustom];
        titleBtn.frame = CGRectMake(titleBtnWidth, 0, buttonWidthArr[i] * kMulriple, titleBtnHeight);
        [titleBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:18 * kMulriple];
        titleBtn.tag = 200 + i;
        
        titleBtnWidth += buttonWidthArr[i] + space;
        
        [_titleScrollView addSubview:titleBtn];
        [_titleBtnFrame addObject:titleBtn];
        [titleBtn addTarget:self action:@selector(checkTitleBtnSeletorScrollPage:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}

//按钮点击方法
- (void)checkTitleBtnSeletorScrollPage:(MYButton *)sender {
    
    [_titleBtnFrame[0] setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
    int page = (int)(sender.tag - 200);
    
    [self didSelectPage:page];
    self.mainScrollView.contentOffset = CGPointMake(kWight * page, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [_titleBtnFrame[0] setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
    if ([[scrollView class] isSubclassOfClass:[UITableView class]]) {
        return;
    }
    
    int page = scrollView.contentOffset.x / kWight;
    [self didSelectPage:page];
}


- (void)didSelectPage:(int)page {
    
    switch (page) {
        case 0:
            _titleTagView.frame = [self titleTagViewFrameTag:0];
            break;
            
        case 1:
            _titleTagView.frame = [self titleTagViewFrameTag:1];
            break;
            
        default:
            break;
    }
    
}


- (CGRect)titleTagViewFrameTag:(int)tag {
    
    _currentBtn.selected = NO;
    MYButton *btn = _titleBtnFrame[tag];
    btn.selected = YES;
    
    _currentBtn = btn;
    CGRect rect = btn.frame;
    
    return CGRectMake(rect.origin.x - 7.5 * kMulriple, 40 * kHMulriple, btn.bounds.size.width + 15 * kMulriple, 4 * kHMulriple);
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        }

    
    if (tableView == _finishTableView) {
        
                FinishViewCell *finishCell = [_finishTableView dequeueReusableCellWithIdentifier:@"FinishViewCell" forIndexPath:indexPath];
                finishCell.selectionStyle = UITableViewCellSelectionStyleNone;
                return finishCell;
        
    } else if (self.mainScrollView.contentOffset.x == 2 * kWight) {
        
        AppointmentCell *mentCell = [_appointmentTableView dequeueReusableCellWithIdentifier:@"AppointmentCell" forIndexPath:indexPath];
        mentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return mentCell;
        
    }
    
//    static NSString *identifier = @"cell";
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    if (!cell) {
//        cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    }
//    
//    if (_currentBtn.tag == 200) {
//        FinishViewCell *finishCell = [tableView dequeueReusableCellWithIdentifier:@"FinishViewCell" forIndexPath:indexPath];
//        finishCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return finishCell;
//    } else if (_currentBtn.tag == 201) {
//        
//        AppointmentCell *mentCell = [tableView dequeueReusableCellWithIdentifier:@"AppointmentCell" forIndexPath:indexPath];
//        mentCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return mentCell;
//        
//    }
//    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80 * kHMulriple;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListDetailController *listVC = [[ListDetailController alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
    
}




@end
