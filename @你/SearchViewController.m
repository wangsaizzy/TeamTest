//
//  SearchViewController.m
//  @你
//
//  Created by 王赛 on 16/3/31.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "SearchViewController.h"
#import "WSCommon.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNavgation];
}


-(void)setNavgation{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 10, 30, 30)];
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    btn. contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;

    [btn setBackgroundImage:[UIImage imageNamed:@"goback"] forState:UIControlStateNormal];
    [btn setTitle:@"hah"forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


[btn addTarget:self action:@selector(SearchClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:btn];

    self.navigationItem.leftBarButtonItem = right;

}
-(void) SearchClick:(UIButton *)btn
{
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UITableViewController * vc = [sb instantiateViewControllerWithIdentifier:@"SearchVC"];
//    [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
