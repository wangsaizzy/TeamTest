//
//  AlertPersonalDataView.h
//  @的你
//
//  Created by 吴明飞 on 16/3/15.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertPersonalDataView : UIView
@property (nonatomic, strong) UIImageView *headPhotoImage;
@property (nonatomic, strong) UITextField *nickTF;
@property (nonatomic, strong) UILabel *sexLabel;
@property (nonatomic, strong) UIButton *sexBtn;
@property (nonatomic, strong) UIButton *headImageBtn;
@property (nonatomic, strong) UIButton *alertBaseDataBtn;
@property (nonatomic, strong) UIButton *connectPhoneBtn;
@property (nonatomic, strong) UIButton *alertSecretBtn;
@property (nonatomic, strong) UILabel *phoneLabel;
//- (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize
//{
//    //先调整分辨率
//    CGSize newSize = CGSizeMake(source_image.size.width, source_image.size.height);
//
//    CGFloat tempHeight = newSize.height / 1024;
//    CGFloat tempWidth = newSize.width / 1024;
//
//    if (tempWidth > 1.0 && tempWidth > tempHeight) {
//        newSize = CGSizeMake(source_image.size.width / tempWidth, source_image.size.height / tempWidth);
//    }
//    else if (tempHeight > 1.0 && tempWidth < tempHeight){
//        newSize = CGSizeMake(source_image.size.width / tempHeight, source_image.size.height / tempHeight);
//    }
//
//    UIGraphicsBeginImageContext(newSize);
//    [source_image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    //调整大小
//    NSData *imageData = UIImageJPEGRepresentation(newImage,1.0);
//    NSUInteger sizeOrigin = [imageData length];
//    NSUInteger sizeOriginKB = sizeOrigin / 1024;
//    if (sizeOriginKB > maxSize) {
//        NSData *finallImageData = UIImageJPEGRepresentation(newImage,0.50);
//        return finallImageData;
//    }
//
//    return imageData;
//}



//- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
//    // 创建一个bitmap的context
//    // 并把它设置成为当前正在使用的context
//    UIGraphicsBeginImageContext(size);
//    // 绘制改变大小的图片
//    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
//    // 从当前context中创建一个改变大小后的图片
//    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
//    // 使当前的context出堆栈
//    UIGraphicsEndImageContext();
//    //返回新的改变大小后的图片
//    return scaledImage;
//}
//
////等比例压缩
//-(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size{
//    UIImage *newImage = nil;
//    CGSize imageSize = sourceImage.size;
//    CGFloat width = imageSize.width;
//    CGFloat height = imageSize.height;
//    CGFloat targetWidth = size.width;
//    CGFloat targetHeight = size.height;
//    CGFloat scaleFactor = 0.0;
//    CGFloat scaledWidth = targetWidth;
//    CGFloat scaledHeight = targetHeight;
//    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
//    if(CGSizeEqualToSize(imageSize, size) == NO){
//        CGFloat widthFactor = targetWidth / width;
//        CGFloat heightFactor = targetHeight / height;
//        if(widthFactor > heightFactor){
//            scaleFactor = widthFactor;
//        }
//        else{
//            scaleFactor = heightFactor;
//        }
//        scaledWidth = width * scaleFactor;
//        scaledHeight = height * scaleFactor;
//        if(widthFactor > heightFactor){
//            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
//        }else if(widthFactor < heightFactor){
//            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
//        }
//    }
//
//    UIGraphicsBeginImageContext(size);
//
//    CGRect thumbnailRect = CGRectZero;
//    thumbnailRect.origin = thumbnailPoint;
//    thumbnailRect.size.width = scaledWidth;
//    thumbnailRect.size.height = scaledHeight;
//    [sourceImage drawInRect:thumbnailRect];
//    newImage = UIGraphicsGetImageFromCurrentImageContext();
//
//    if(newImage == nil){
//        NSLog(@"scale image fail");
//    }
//
//    UIGraphicsEndImageContext();
//
//    return newImage;
//
//}

//-(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
//    UIImage *newImage = nil;
//    CGSize imageSize = sourceImage.size;
//    CGFloat width = imageSize.width;
//    CGFloat height = imageSize.height;
//    CGFloat targetWidth = defineWidth;
//    CGFloat targetHeight = height / (width / targetWidth);
//    CGSize size = CGSizeMake(targetWidth, targetHeight);
//    CGFloat scaleFactor = 0.0;
//    CGFloat scaledWidth = targetWidth;
//    CGFloat scaledHeight = targetHeight;
//    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
//    if(CGSizeEqualToSize(imageSize, size) == NO){
//        CGFloat widthFactor = targetWidth / width;
//        CGFloat heightFactor = targetHeight / height;
//        if(widthFactor > heightFactor){
//            scaleFactor = widthFactor;
//        }
//        else{
//            scaleFactor = heightFactor;
//        }
//        scaledWidth = width * scaleFactor;
//        scaledHeight = height * scaleFactor;
//        if(widthFactor > heightFactor){
//            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
//        }else if(widthFactor < heightFactor){
//            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
//        }
//    }
//    UIGraphicsBeginImageContext(size);
//    CGRect thumbnailRect = CGRectZero;
//    thumbnailRect.origin = thumbnailPoint;
//    thumbnailRect.size.width = scaledWidth;
//    thumbnailRect.size.height = scaledHeight;
//
//    [sourceImage drawInRect:thumbnailRect];
//
//    newImage = UIGraphicsGetImageFromCurrentImageContext();
//    if(newImage == nil){
//        NSLog(@"scale image fail");
//    }
//
//    UIGraphicsEndImageContext();
//    return newImage;
//}

@end
