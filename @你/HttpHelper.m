//
//  HttpHelper.m
//  @的你
//
//  Created by 吴明飞 on 16/4/23.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "HttpHelper.h"
#import "AFNetworking.h"
@implementation HttpHelper

//普通POST请求
+ (void)post:(NSString *)URL param:(NSDictionary *)param finishBlock:(void (^) (NSURLResponse *response, NSData *data, NSError *connectionError)) block {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", Service_Url, URL];
    NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //把传进来的URL字符串变为URL地址
    NSURL *url = [NSURL URLWithString:urlStr];
    
    //请求初始化
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20];
    
    //解析请求参数，用NSDictionary来存参数，通过自定义的函数把它解析成post格式的字符串
    NSString *parseParam = [self setDictionaryToString:param];
    
    NSData *postData = [parseParam dataUsingEncoding:NSUTF8StringEncoding];
    
    
    //设置请求体
    [request setHTTPBody:postData];
    
    //设置请求方法
    [request setHTTPMethod:@"POST"];
    
    
    
    //创建一个新的队列
    NSOperationQueue *queue = [NSOperationQueue new];
    
    //发送异步请求，请求完以后返回的数据，通过completionHandler参数来调用
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:block];
}


//字典转字符串
+ (NSString *)setDictionaryToString:(NSDictionary *)dic {
    
    NSString *keyValueFormat;
    NSMutableString *result = [NSMutableString new];
    //实例化一个key枚举器用来存放dictionary的key
    NSEnumerator *keyEnum = [dic keyEnumerator];
    id key;
    while (key = [keyEnum nextObject]) {
        keyValueFormat = [NSString stringWithFormat:@"%@=%@&",key,[dic valueForKey:key]];
        [result appendString:keyValueFormat];
    }
    return result;
}

//上传头像
- (void)uploadFileWithMethod:(NSString *)method
                         URL:(NSString *)urlPath
                       param:(NSDictionary *)param
                        name:(NSString *)name
                       image:(UIImage *)image
                   imageData:(NSData *)imageData
                     success:(void (^)(id))success
                     failure:(void (^)(NSError *))failure
                    progress:(void (^)(long long, long long))progress {
    
    if (!image) {
        //执行失败操作代码块
        if (failure) {
            NSError *error = [[NSError alloc] initWithDomain:@"请选择图片上传，图片不能不空" code:0 userInfo:nil];
            failure(error);
        }
        return;
    }
    
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    
    
    request = [serializer multipartFormRequestWithMethod:method URLString:urlPath parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];

        
        [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/jpeg"];
        
    } error:nil];
    
    
    
}


@end
