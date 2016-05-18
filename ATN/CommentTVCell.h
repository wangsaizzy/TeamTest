//
//  CommentTVCell.h
//  ATN
//
//  Created by 王赛 on 16/5/15.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShoplistModel;
@interface CommentTVCell : UITableViewCell
/**  用户头像 */
@property (weak, nonatomic) IBOutlet UIImageView *userImg;
/**  用户名*/
@property (weak, nonatomic) IBOutlet UILabel *userName;
/**  交易类型*/
@property (weak, nonatomic) IBOutlet UILabel *transactionType;
/**  评价星级*/
@property (weak, nonatomic) IBOutlet UIImageView *starImg;
/**  交易时间*/
@property (weak, nonatomic) IBOutlet UILabel *transTime;
/**  评论详情*/
@property (weak, nonatomic) IBOutlet UILabel *commentDetail;

/**  商铺评论模型 */
@property (nonatomic, strong) ShoplistModel *shopCommentmodel;
@end
