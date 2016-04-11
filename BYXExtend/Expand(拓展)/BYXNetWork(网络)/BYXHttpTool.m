//
//  BYXHttpTool.m
//  封装网络库
//
//  Created by bianyixuan on 16/4/8.
//  Copyright (c) 2016年 bianyixuan. All rights reserved.

#import "BYXHttpTool.h"

@implementation BYXHttpTool

#pragma mark - get -
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler
{
    AFHTTPSessionManager *mgr = [self getRequstManager];
    
    [mgr GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self prettyPrintAboutHttpWithOperation:task withParams:params withResponseObj:responseObject withManager: mgr];
        !successHandler?:successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failureHandler?:failureHandler(error);
    }];
 
}

#pragma mark - post -
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler
{
    AFHTTPSessionManager *mgr = [self getRequstManager];
    
    [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self prettyPrintAboutHttpWithOperation:task withParams:params withResponseObj:responseObject withManager: mgr];
        !successHandler?:successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failureHandler?:failureHandler(error);
    }];
}

#pragma mark - put -
+ (void)put:(NSString *)url params:(NSDictionary *)params success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler
{
    AFHTTPSessionManager *mgr = [self getRequstManager];
 
    [mgr PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self prettyPrintAboutHttpWithOperation:task withParams:params withResponseObj:responseObject withManager: mgr];
        !successHandler?:successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failureHandler?:failureHandler(error);
    }];
}

#pragma mark - delete-
+ (void)deleteRequest:(NSString *)url params:(NSDictionary *)params success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler;
{
    AFHTTPSessionManager *mgr = [self getRequstManager];
    
    [mgr DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self prettyPrintAboutHttpWithOperation:task withParams:params withResponseObj:responseObject withManager: mgr];
        !successHandler?:successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failureHandler?:failureHandler(error);
    }];
}

#pragma mark - post 上传图片-
+(void)uploadAvatarImgWithUrl:(NSString *)url WithImg:(UIImage *)avatarImg fileName:(NSString *)fileName success:(responseBlock)successHandler failure:(requestFailureBlock)failureHandler
{
    AFHTTPSessionManager *mgr = [self getRequstManager];
    NSData *imgData = UIImageJPEGRepresentation(avatarImg, 0.5);
 
    
    [mgr POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:imgData name:@"file" fileName:fileName mimeType:@"image/jpeg"];

    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self prettyPrintAboutHttpWithOperation:task withParams:nil withResponseObj:responseObject withManager: mgr];
        !successHandler?:successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failureHandler?:failureHandler(error);
    }];
}

#pragma mark- AFHTTPRequestOperationManager初始化 网络超时设置 请求头
+(AFHTTPSessionManager *)getRequstManager
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 设置token
//     [mgr.requestSerializer setValue:@"" forHTTPHeaderField:@"access_token"];
    
    // 请求超时设定
     mgr.requestSerializer.timeoutInterval = 20;
    return mgr;
}

#pragma mark- 打印url 和 json数据 httpHeader用于调试
+(void)prettyPrintAboutHttpWithOperation:(NSURLSessionTask *)operation withParams:(NSDictionary *)params withResponseObj:(id)responseObj withManager:(AFHTTPSessionManager *)mgr
{
#if DEBUG
    // 请求的url
    
     NSLog(@"请求的url: %@", operation.currentRequest.URL.absoluteString);
    
    // 请求参数
    NSLog(@"请求参数params: %@",params);
    
    //  请求的json数据打印
     NSData *dataJson = [NSJSONSerialization dataWithJSONObject:responseObj options:NSJSONWritingPrettyPrinted error:nil];
     NSString *jsonStr = [[NSString alloc] initWithData:dataJson encoding:NSUTF8StringEncoding];
     NSLog(@"请求的json数据: %@", jsonStr);
    
    //  请求的header信息
//     NSDictionary *dict = mgr.requestSerializer.HTTPRequestHeaders;
//    
//     NSLog(@"请求头httpHeader: %@", dict);
#endif
}

@end
