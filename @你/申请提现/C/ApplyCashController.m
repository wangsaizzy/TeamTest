//
//  ApplyCashController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/28.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "ApplyCashController.h"
#import "ApplyCashView.h"
@interface ApplyCashController ()

@end

@implementation ApplyCashController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.view.backgroundColor = RGB(238, 238, 238);
    ApplyCashView *applyView = [[ApplyCashView alloc] initWithFrame:self.view.bounds];
    self.view = applyView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
