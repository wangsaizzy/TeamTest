//
//  CyclicImageView.m
//  ATN
//
//  Created by 王赛 on 16/4/18.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "CyclicImageView.h"
#import "CyclicImagePageController.h"
#import "UIImageView+WebCache.h"
#import "WSCommon.h"

#define WIDTH               CGRectGetWidth(self.frame)
#define HEIGHT              CGRectGetHeight(self.frame)



@interface CyclicImageView ()
@property (nonatomic, strong) UIScrollView  *mySrollerView;
@property (nonatomic, strong) CyclicImagePageController *pageControl;   //
@property (nonatomic, strong) UIView        *showView;      //展示栏目
@property (nonatomic, strong) UILabel       *textLable;     //文字介绍Lable

@property (nonatomic, weak)   NSTimer       *timer;         //定时器

@property (nonatomic, strong) NSMutableArray *images;       //所有图片

@property (nonatomic, strong) NSMutableArray *titles;       //文字


// 当前选中的第几个图片
@property (nonatomic, assign) NSInteger      selectIndex;

@property (nonatomic, assign) BOOL           isURLImg;//是否加载网络的图片
@end



@implementation CyclicImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _titles = [NSMutableArray array];
        _selectIndex = 0;
        _autoSroller = YES;
        self.autoSrollerTimerInterval = 2; //默认2S
        
        
        [self addSubview:self.mySrollerView];
        [self addSubview:self.showView];
        [_showView addSubview:self.textLable];
        [_showView addSubview:self.pageControl];
        [_mySrollerView setContentOffset:CGPointMake(CGRectGetWidth(self.frame), 0)];
        [self setTextAliment:HHTextAlignmentRight];
        
    }
    return self;
}

- (UIScrollView*)mySrollerView
{
    if (!_mySrollerView)
    {
        _mySrollerView = [[UIScrollView alloc] initWithFrame:
                          CGRectMake(0, 0, CGRectGetWidth(self.frame), self.frame.size.height)];
        _mySrollerView.contentSize = CGSizeMake(3 * CGRectGetWidth(self.frame), 0);
        
        _mySrollerView.bounces = NO;
        _mySrollerView.pagingEnabled = YES;
        _mySrollerView.showsHorizontalScrollIndicator = NO;
        _mySrollerView.delegate = self;
        _mySrollerView.showsVerticalScrollIndicator = NO;
        
        for (int index = 0;index < 3 ; index ++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(index*CGRectGetWidth(self.frame), 0,  CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
//            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, kScreenWidth, 150)];
            
            imageView.userInteractionEnabled = YES;
            
            [_mySrollerView addSubview:imageView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
            
            [imageView addGestureRecognizer:tap];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            
            imageView.tag = 100+index;
        }
        
        
    }
    return _mySrollerView;
}
- (UIPageControl*)pageControl
{
    if (!_pageControl)
    {
        _pageControl = [[CyclicImagePageController alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-120, 5, 100, 20)];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.alpha = 0.4;
        
        //        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        //        _pageControl.pageIndicatorTintColor = [UIColor greenColor];
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
    
}
- (UIView*)showView
{
    if (!_showView)
    {
        _showView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-30, CGRectGetWidth(self.frame), 30)];
        _showView.backgroundColor = [UIColor blackColor];
        _showView.alpha = 0.8;
    }
    return _showView;
}
- (UILabel*)textLable
{
    if (!_textLable)
    {
        _textLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, CGRectGetWidth(self.frame) -160, 20)];
        _textLable.backgroundColor = [UIColor clearColor];
        _textLable.font = [UIFont systemFontOfSize:15];
        _textLable.textColor = [UIColor yellowColor];
        _textLable.textAlignment = NSTextAlignmentLeft;
    }
    return _textLable;
}
- (void)scrollerViewContenSize:(NSInteger)count
{
    _mySrollerView.contentSize = CGSizeMake(count*CGRectGetWidth(self.frame), 0);
}
#pragma mark -- 处理数据数据

//本地数据
- (void)setImageArray:(NSArray *)imageArray
{
    _isURLImg = NO; /** <本地图片 > **/
    
    
    _pageControl.numberOfPages = imageArray.count;
    
    self.images = [NSMutableArray arrayWithArray:imageArray];
    
    [self refersh:0];/** < 刷新UI界面 > **/
}

//网络图片数据
- (void)setImageURLArray:(NSArray *)imageURLArray
{
    
    _isURLImg = YES; /** < 网络图片 > **/
    
    _pageControl.numberOfPages = imageURLArray.count;
    
    [self.images setArray:imageURLArray];
    self.images = [NSMutableArray arrayWithArray:imageURLArray];
    
    [self refersh:0]; /** < 加载数据 > **/
}
//标题
- (void)setTitleArray:(NSArray *)titleArray
{
    [_titles setArray:titleArray];
}

//设置文字颜色
-(void)setTextColor:(UIColor *)textColor
{
    _textLable.textColor = textColor;
}
//是否自动滚动
- (void)setAutoSroller:(BOOL)autoSroller
{
    _autoSroller = autoSroller;
    [_timer invalidate];
    _timer = nil;
    
    if (_autoSroller)
    {
        [self setupTimer];
    }
}
//文字位置
- (void)setTextAliment:(HHTextAlignment)textAliment
{
    _pageControl.numberOfPages = _images.count;
    _textAliment = textAliment;
    if (_textAliment == HHTextAlignmentRight)
    {
        [_pageControl setFrame:CGRectMake(20, 5, 100, 20)];
        [_textLable setFrame:CGRectMake(140, 5, WIDTH - 160, 20)];
        _textLable.textAlignment = NSTextAlignmentRight;
    }
    else
    {
        [_textLable setFrame:CGRectMake(20, 5, WIDTH -160, 20)];
        [_pageControl setFrame:CGRectMake(HEIGHT - 120, 5, 100, 20)];
        _textLable.textAlignment = NSTextAlignmentLeft;
    }
}
////是否显示控制图标
//- (void)setShowPageControl:(BOOL)showPageControl
//{
//    _showPageControl = showPageControl;
//    if (_showPageControl)
//    {
//        if (self.textAliment == HHTextAlignmentRight)
//        {
//            [_pageControl setFrame:CGRectMake(20, 5, 100, 20)];
//            [_textLable setFrame:CGRectMake(140, 5, SCREEN_WIDTH - 160, 20)];
//            _textLable.textAlignment = NSTextAlignmentRight;
//        }
//        else
//        {
//            [_textLable setFrame:CGRectMake(20, 5, SCREEN_WIDTH -160, 20)];
//            [_pageControl setFrame:CGRectMake(SCREEN_WIDTH - 120, 5, 100, 20)];
//            _textLable.textAlignment = NSTextAlignmentLeft;
//        }
//    }
//    else
//    {
//        [_textLable setFrame:CGRectMake(20, 5, self.frame.size.width -40, 20)];
//    }
//}
#pragma mark -- 
- (void)setImages:(NSMutableArray *)images
{
    _images = images;
    if (_images.count <=1) //只有一张图片时候 不创建定时器
    {
        [self setAutoSroller:NO];
    }
    else
    {
        [self setAutoSroller:self.autoSroller];
    }
    
}
/**
 *  定时器的方法
 */
- (void)automaticScroll
{
    [_mySrollerView setContentOffset:CGPointMake(WIDTH * 2,0)
                            animated:YES];
}
- (void)setPlaceholderImage:(UIImage *)placeholderImage
{
    _placeholderImage = placeholderImage;
}
#pragma mark -- 点击图片
- (void)clicked:(UITapGestureRecognizer*)tap
{
    //    NSLog(@"点击的%ld图片",_selectIndex);
    if (self.selcetBlock)
    {
        self.selcetBlock(_selectIndex);
    }
}
//定时器
- (void)setupTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.autoSrollerTimerInterval
                                                      target:self
                                                    selector:@selector(automaticScroll)
                                                    userInfo:nil
                                                     repeats:YES];
    _timer = timer;
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

#pragma mark -- UIScrollerView的代理方法

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //这些是避免在自动滚动中 由于手动造成的滑动而影响下一个或者前面一个的滚动时间 结束后在加上定时器
    if (_autoSroller)
    {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updatePage];
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updatePage];
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_autoSroller)
    {
        [self setupTimer];
    }
}

//更新数据
- (void)updatePage
{
    CGFloat pageWidth = CGRectGetWidth(self.frame);
    NSInteger fractonalPage = _mySrollerView.contentOffset.x / pageWidth;
    
    
    if (_mySrollerView.contentOffset.x > self.frame.size.width)
    {
        if (fractonalPage ==1) /** < 避免滑动一点点的时候 就去改变数据 > **/
        {
            return;
        }
//        NSLog(@"------向左滑动------%ld",fractonalPage);
        _selectIndex ++;
        if (_selectIndex >_images.count-1)
        {
            _selectIndex = 0;
        }
    }
    else
    {
        if (fractonalPage ==1)
        {
            return;
        }
//        NSLog(@"------向右滑动------%ld",fractonalPage);
        _selectIndex --;
        if (_selectIndex < 0)
        {
            _selectIndex = _images.count -1;
        }
    }
    
    [self refersh:_selectIndex];
    
}
- (void)refersh:(NSInteger)currenIndex
{
    _mySrollerView.contentOffset = CGPointMake(CGRectGetWidth(self.frame) , 0);
    
    if (_titles.count > 0)
    {
        _textLable.text = _titles[currenIndex];
    }
//    NSLog(@"------图片------%ld",currenIndex);
    _pageControl.currentPage = currenIndex;
    
    NSArray *array = [self showImageArray:currenIndex];
    
    for (int index = 0; index < [array count]; index++)
    {
        //把需要展示的图片放在imageView上展示
        UIImageView * imgView = _mySrollerView.subviews[index];
        
        if (_isURLImg)
        {
            [imgView sd_setImageWithURL:[NSURL URLWithString:array[index]]
                       placeholderImage:self.placeholderImage];
        }
        else
        {
            imgView.image = [UIImage imageNamed:array[index]];
        }
        
        if (_images.count ==1)
        {
            _mySrollerView.contentSize = CGSizeMake(WIDTH, 0);
        }
        
    }
    
}
/**
 判断区的数据
 */
// 越界判断 返回正确的数组下标
- (NSInteger)selectIndex:(NSInteger)index
{
    
    if (index < 0) // 最后一张
    {
        index = _images.count-1;
    }
    
    else if (index > _images.count-1) // 回到第一张
    {
        index = 0;
    }
    return index;
}
//获取当前要展示的三张图片
- (NSMutableArray*)showImageArray:(NSInteger)currenIndex
{
    //获取三个图片的下标 当前页面 前一个页面 和后一面的图片的下标
    NSInteger lastIndex  = [self selectIndex:currenIndex -1];
    NSInteger nowIndx    = [self selectIndex:currenIndex];
    NSInteger nextIndx   = [self selectIndex:currenIndex+1];
    
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    
    [arry addObject:_images[lastIndex]];
    [arry addObject:_images[nowIndx]];
    [arry addObject:_images[nextIndx]];
    
    return arry;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
