//
//  UserCommentCell.m
//  @的你
//
//  Created by 吴明飞 on 16/3/31.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "UserCommentCell.h"

@implementation UserCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.userImage];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.standardLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.commentFirstPicture];
        [self addSubview:self.commentSecondPicture];
        [self addSubview:self.commentThirdPicture];
    }
    return self;
}

#pragma mark -懒加载
//用户头像
- (UIImageView *)userImage {
    if (!_userImage) {
        self.userImage = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 10 * kHMulriple, 40 * kMulriple, 40 * kHMulriple)];
        self.userImage.backgroundColor = [UIColor magentaColor];
    }
    return _userImage;
}

//用户名
- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70 * kMulriple, 10 * kHMulriple, 100 * kMulriple, 20 * kHMulriple)];
    }
    return _userNameLabel;
}

//产品规格
-standardLabel {
    if (!_standardLabel) {
        self.standardLabel = [[UILabel alloc] initWithFrame:CGRectMake(70 * kMulriple, 32 * kHMulriple, 80 * kMulriple, 18 * kHMulriple)];
    }
    return _standardLabel;
}

//时间
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(295 * kMulriple, 10 * kHMulriple, 60 * kMulriple, 20 * kHMulriple)];
    }
    return _timeLabel;
}

//评论内容
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kMulriple, 70 * kHMulriple, 335 * kMulriple, 45)];
        self.contentLabel.font = [UIFont systemFontOfSize:14 * kMulriple];
    }
    return _contentLabel;
}

//评论图片
- (UIImageView *)commentFirstPicture {
    if (!_commentFirstPicture) {
        self.commentFirstPicture = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kMulriple, 135 * kHMulriple, 70 * kMulriple, 70 * kHMulriple)];
        self.commentFirstPicture.backgroundColor = [UIColor purpleColor];
    }
    return _commentFirstPicture;
}

- (UIImageView *)commentSecondPicture {
    if (!_commentSecondPicture) {
        self.commentSecondPicture = [[UIImageView alloc] initWithFrame:CGRectMake(100 * kMulriple, 135 * kHMulriple, 70 * kMulriple, 70 * kHMulriple)];
        self.commentSecondPicture.backgroundColor = [UIColor purpleColor];
    }
    return _commentSecondPicture;
}

- (UIImageView *)commentThirdPicture {
    if (!_commentThirdPicture) {
        self.commentThirdPicture = [[UIImageView alloc] initWithFrame:CGRectMake(180 * kMulriple, 135 * kHMulriple, 70 * kMulriple, 70 * kHMulriple)];
        self.commentThirdPicture.backgroundColor = [UIColor purpleColor];
    }
    return _commentThirdPicture;
}


- (void)setFrame:(CGRect)frame {
    frame.size.width = kWight;
    
    frame.size.height = 320 * kHMulriple;
    [super setFrame:frame];
}

//动态计算文本的高度
+ (CGFloat)heightForContentText:(NSString *)text{
    //文本渲染时需要一个矩形的大小 第一个参数:size 在限定的范围(宽高区域内) size(控件的宽度, 尽量大的高度值)
    //attributes属性:设置的字体大小要和控件(contentLabel)的字体大小匹配一致 避免出现计算偏差
    
    CGSize size = CGSizeMake(335, 1000);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:style};
    return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.height;
}



@end
