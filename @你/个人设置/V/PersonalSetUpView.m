//
//  PersonalSetUpView.m
//  @的你
//
//  Created by 吴明飞 on 16/3/29.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "PersonalSetUpView.h"

@implementation PersonalSetUpView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        
        self.backgroundColor = RGB(238, 238, 238);
    }
    return self;
}

- (void)setupViews {
    UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWight, 225 * kHMulriple)];
    headImageView.backgroundColor = [UIColor orangeColor];
    [self addSubview:headImageView];

    
    /*
     第1个View
     
     
     */
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 225 * kHMulriple, kWight, 55 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    
    
    //检查更新
    //Label
    UILabel *updateTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    updateTextLabel.text = @"检查更新";
    updateTextLabel.textColor = RGB(111, 111, 111);
    
    //版本label
    UILabel *editionLabel = [[UILabel alloc] initWithFrame:CGRectMake(245 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    editionLabel.text = @"1.0.1";
    editionLabel.textAlignment = NSTextAlignmentRight;
    editionLabel.font = [UIFont systemFontOfSize:17 * kMulriple];
    editionLabel.textColor = RGB(111, 111, 111);
    
    //右箭头
    UIImageView *updateDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [updateDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.checkUpdateBtn addSubview:updateTextLabel];
    [self.checkUpdateBtn addSubview:updateDirectImage];
    [self.checkUpdateBtn addSubview:editionLabel];
    
    [firstView addSubview:self.checkUpdateBtn];
    [self addSubview:firstView];
    
    
    
   
    
    /*
     第2个View
     
     
     */
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 290 * kHMulriple, kWight, 165 * kHMulriple)];
    secondView.backgroundColor = [UIColor whiteColor];
    
    
    //清除缓存
    //Label
    UILabel *cleanTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    cleanTextLabel.text = @"清除缓存";
    cleanTextLabel.textColor = RGB(111, 111, 111);
    
    //显示缓存大小label
    UILabel *cacheTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(270 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    cacheTextLabel.text = @"15.5M";
    cacheTextLabel.textAlignment = NSTextAlignmentRight;
    cacheTextLabel.textColor = RGB(111, 111, 111);

    [self.cleanCacheBtn addSubview:cleanTextLabel];
    [self.cleanCacheBtn addSubview:cacheTextLabel];
    [secondView addSubview:self.cleanCacheBtn];
    
    
    //意见反馈
    //Label
    UILabel *alertTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    alertTextLabel.text = @"意见反馈";
    alertTextLabel.textColor = RGB(111, 111, 111);
    
    
    //image
    UIImageView *alertDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [alertDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    [self.backAdviseBtn addSubview:alertTextLabel];
    [self.backAdviseBtn addSubview:alertDirectImage];
    [secondView addSubview:self.backAdviseBtn];
    

    //关于我们
    //Label
    UILabel *aboutTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 85 * kMulriple, 25 * kHMulriple)];
    aboutTextLabel.text = @"关于我们";
    aboutTextLabel.textColor = RGB(111, 111, 111);
    
    //image
    UIImageView *aboutDirectImage = [[UIImageView alloc] initWithFrame:CGRectMake(340 * kMulriple, 15 * kHMulriple, 15 * kMulriple, 25 * kHMulriple)];
    [aboutDirectImage setImage:[UIImage imageNamed:@"通用-返回_r"]];
    
    [self.aboutUsBtn addSubview:aboutTextLabel];
    
    [self.aboutUsBtn addSubview:aboutDirectImage];
    [secondView addSubview:self.aboutUsBtn];
    
    for (int i = 0; i < 3; i++) {
        //分割线
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, i * 54 * kHMulriple, kWight, 1 * kHMulriple)];
        lineLabel.backgroundColor = RGB(237, 237, 237);
        [secondView addSubview:lineLabel];
    }

    [self addSubview:secondView];
    
    
    
}

#pragma mark -懒加载
//检查更新按钮
- (UIButton *)checkUpdateBtn {
    if (!_checkUpdateBtn) {
        self.checkUpdateBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWight, 55 * kHMulriple)];
    }
    return _checkUpdateBtn;
}

//清除缓存按钮
- (UIButton *)cleanCacheBtn {
    if (!_cleanCacheBtn) {
        self.cleanCacheBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWight, 55 * kHMulriple)];
    }
    return _cleanCacheBtn;
}

//意见反馈按钮
- (UIButton *)backAdviseBtn {
    if (!_backAdviseBtn) {
        self.backAdviseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 55 * kHMulriple, kWight, 55 * kHMulriple)];
    }
    return _backAdviseBtn;
}

//关于我们按钮
- (UIButton *)aboutUsBtn {
    if (!_aboutUsBtn) {
        self.aboutUsBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 110 * kHMulriple, kWight, 55 * kHMulriple)];
    }
    return _aboutUsBtn;
}


@end
