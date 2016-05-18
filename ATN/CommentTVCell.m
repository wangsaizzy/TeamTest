//
//  CommentTVCell.m
//  ATN
//
//  Created by 王赛 on 16/5/15.
//  Copyright © 2016年 王赛. All rights reserved.
//**  用户头像 */
//@property (weak, nonatomic) IBOutlet UIImageView *userImg;
///**  用户名*/
//@property (weak, nonatomic) IBOutlet UILabel *userName;
///**  交易类型*/
//@property (weak, nonatomic) IBOutlet UILabel *transactionType;
///**  评价星级*/
//@property (weak, nonatomic) IBOutlet UIImageView *starImg;
///**  交易时间*/
//@property (weak, nonatomic) IBOutlet UILabel *transTime;
///**  评论详情*/
//@property (weak, nonatomic) IBOutlet UILabel *commentDetail;/

#import "CommentTVCell.h"
#import "ShoplistModel.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@implementation CommentTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setShopCommentmodel:(ShoplistModel *)shopCommentmodel
{
    _shopCommentmodel = shopCommentmodel;
    
    _userImg.image = [UIImage imageNamed:shopCommentmodel.consumerImg];
    _userName.text = shopCommentmodel.consumerName;
    
    _transactionType.text = shopCommentmodel.dealKind;
    
    _starImg.image = [UIImage imageNamed:shopCommentmodel.level];
    
    _transTime.text = shopCommentmodel.commentTime;
    
    _commentDetail.text = shopCommentmodel.commentDet;
    
}

@end









