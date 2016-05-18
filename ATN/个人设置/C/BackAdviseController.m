//
//  BackAdviseController.m
//  ATN
//
//  Created by 吴明飞 on 16/4/27.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "BackAdviseController.h"

@interface BackAdviseController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *commitBtn;


@end

@implementation BackAdviseController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (UITextView *)textView {
    
    if (!_textView) {
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20 * kMulriple, 55 * kHMulriple, 335 * kMulriple, 160 * kHMulriple)];
        _textView.backgroundColor = RGB(238, 238, 238);
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:14.f];
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.editable = YES;

        
    }
    return _textView;
    
}

- (UIButton *)commitBtn {
    if (!_commitBtn) {
        self.commitBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _commitBtn.frame = CGRectMake(0, 0, kWight, 65 * kHMulriple);
        [_commitBtn setTitle:@"提交反馈" forState:UIControlStateNormal];
        _commitBtn.titleLabel.font = [UIFont systemFontOfSize:19 * kMulriple];
        [_commitBtn setTitleColor:RGB(111, 111, 111) forState:UIControlStateNormal];
        
    }
    return _commitBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    
    self.view.backgroundColor = RGB(238, 238, 238);
    
    /*
     第1个View
     
     
     */
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 10 * kHMulriple, kWight, 235 * kHMulriple)];
    firstView.backgroundColor = [UIColor whiteColor];
    
    
    //检查更新
    //Label
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 15 * kHMulriple, 280 * kMulriple, 25 * kHMulriple)];
    textLabel.text = @"感谢您的反馈，我们将做得更好！";
    textLabel.font = [UIFont systemFontOfSize:17 * kMulriple];
    textLabel.textColor = RGB(111, 111, 111);
    [firstView addSubview:textLabel];
    [firstView addSubview:self.textView];
    
    [self.view addSubview:firstView];
    
    /*
     第2个View
     
     
     */
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 255 * kHMulriple, kWight, 65 * kHMulriple)];
    secondView.backgroundColor = [UIColor whiteColor];
    
    [secondView addSubview:self.commitBtn];
    
    [self.view addSubview:secondView];

    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        
        
        return NO;
    }
    
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_textView resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
