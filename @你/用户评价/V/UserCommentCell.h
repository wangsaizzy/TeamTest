//
//  UserCommentCell.h
//  @的你
//
//  Created by 吴明飞 on 16/3/31.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserCommentModel;
@interface UserCommentCell : UITableViewCell
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *standardLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *commentFirstPicture;
@property (nonatomic, strong) UIImageView *commentSecondPicture;
@property (nonatomic, strong) UIImageView *commentThirdPicture;
@property (nonatomic, strong) UserCommentModel *commentModel;

- (void)setFrame:(CGRect)frame;

@end
