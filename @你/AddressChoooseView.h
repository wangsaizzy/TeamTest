//
//  AddressChoooseView.h
//  @你
//
//  Created by 王赛 on 16/3/31.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressChoooseView : UIView


@property (nonatomic,copy) NSString * btnImage;;
@property (nonatomic,copy) NSString * titleImage;
@property (nonatomic,copy) NSString * titleStr;
@property (nonatomic,copy) NSString * titlePic;
@property (nonatomic, copy) void(^ActionDistrictViewSelectBlock)(NSString *desStr,NSDictionary *selectDistrictDict);


@property (nonatomic, copy) NSString *teamStatu;

-(id)initWithFrame:(CGRect)frame Data:(NSArray *)dataArr;

-(void)showPickerView;


@end
