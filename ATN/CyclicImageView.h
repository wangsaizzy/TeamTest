//
//  CyclicImageView.h
//  ATN
//
//  Created by 王赛 on 16/4/18.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 文字所在方向
 */
typedef NS_ENUM(NSInteger ,HHTextAlignment)
{
    HHTextAlignmentLeft   = 0, //默认文字在左边
    HHTextAlignmentRight  = 1,
    HHTextAlignmentCenter = 2
};

typedef void (^Myblock)(NSInteger index);

@interface CyclicImageView : UIView<UIScrollViewDelegate>

@property (nonatomic, copy) Myblock  selcetBlock;

#pragma mark -- 数据源
// 文字标题
@property (nonatomic, strong) NSArray *titleArray;

// 网络图片
@property (nonatomic, strong) NSArray *imageURLArray;

// 本地图片
@property (nonatomic, strong) NSArray *imageArray;



#pragma mark -- 控制接口

@property (nonatomic, assign) CGFloat autoSrollerTimerInterval; //自动滚动时间间隔
//
@property (nonatomic, assign) BOOL autoSroller; //是否自动滚动 默认自动滚动

@property (nonatomic, strong) UIColor *textColor; //字体颜色

@property (nonatomic, assign) HHTextAlignment textAliment; //文字所在位置

// 占位图，用于网络未加载到图片时
@property (nonatomic, strong) UIImage *placeholderImage;

//// 是否显示分页控件
//@property (nonatomic, assign) BOOL showPageControl;


@end
