//
//  FinishTableView.m
//  ATN
//
//  Created by 吴明飞 on 16/4/26.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "FinishTableView.h"
#import "FinishViewCell.h"

@interface FinishTableView ()

@end

@implementation FinishTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        [self registerClass:[FinishViewCell class] forCellReuseIdentifier:@"FinishViewCell"];
        
    }
    return self;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 2;
}




- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FinishViewCell *finishCell = [self dequeueReusableCellWithIdentifier:@"FinishViewCell" forIndexPath:indexPath];
    return finishCell;
}


@end
