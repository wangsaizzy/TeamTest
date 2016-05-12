//
//  HttpHelper.h
//  @的你
//
//  Created by 吴明飞 on 16/4/23.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HttpHelper : NSObject

//普通POST请求
+ (void)post:(NSString *)URL param:(NSDictionary *)param finishBlock:(void (^) (NSURLResponse *response, NSData *data, NSError *connectionError)) block;


//上传图片
- (void)uploadFileWithMethod:(NSString *)method
                         URL:(NSString *)urlPath
                       param:(NSDictionary *)param
                       image:(UIImage *)image
                  HTTPHeader:(NSMutableDictionary *)requestDic
                     success:(void (^) (id json))success
                     failure:(void (^) (NSError *error)) failure
                    progress:(void (^) (long long totalBytesWritten, long long totalBytesExpectedToWrite))progress;


@end
