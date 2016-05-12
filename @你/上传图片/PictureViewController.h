//
//  PictureViewController.h
//  类似QQ图片添加、图片浏览
//
//  Created by seven on 16/4/1.
//  Copyright © 2016年 QQpicture. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeItemsSectionPictureArrayDelegate <NSObject>

- (void)changeItemsSectionPictureArray:(NSMutableArray *)array index:(NSInteger)index;

@end

@interface PictureViewController : UIViewController
@property(nonatomic,strong)UICollectionView *pictureCollectonView;
@property(nonatomic,strong)NSMutableArray *itemsSectionPictureArray;
@property (nonatomic, assign) NSInteger imageNum;
@property (nonatomic, assign) id<ChangeItemsSectionPictureArrayDelegate>delegate;
@end
