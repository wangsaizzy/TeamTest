//
//  DirectionVC.m
//  @你
//
//  Created by 王赛 on 16/4/22.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "DirectionVC.h"

@interface DirectionVC ()

@property (weak, nonatomic) IBOutlet UILabel *titleName;//题目
@property (weak, nonatomic) IBOutlet UILabel *detialLab;//内容
@property (weak, nonatomic) IBOutlet UIView *bgView;//背景View
@end

@implementation DirectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    
    _bgView.backgroundColor = [UIColor colorWithRed:231.0/255.0 green:231.0/255.0 blue:231.0/255.0 alpha:1.0f];
    
    _detialLab.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:231.0/255.0 blue:241.0/255.0 alpha:1.0f];
    
    
    
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
