//
//  CyclicImagePageController.m
//  ATN
//
//  Created by 王赛 on 16/4/18.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "CyclicImagePageController.h"

@implementation CyclicImagePageController

//重写方法 改变点点的大小
- (void) setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++)
    {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 12;
        size.width = 12;
        [subview setFrame:CGRectMake(subview.frame.origin.x,
                                     subview.frame.origin.x,
                                     size.width,
                                     size.height)];
        subview.layer.cornerRadius = size.width/2;;
        subview.clipsToBounds = YES;
        
        
        if (subviewIndex == page)
        {
            [subview setBackgroundColor:[UIColor redColor]];
        }
        else
        {
            [subview setBackgroundColor:[UIColor greenColor]];
        }
        
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
