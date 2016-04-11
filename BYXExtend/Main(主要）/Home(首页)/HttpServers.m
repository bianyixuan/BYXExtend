//
//  HomeServers.m
//  网络请求demo
//
//  Created by bianyixuan on 16/4/6.
//  Copyright © 2016年 caoxiaobo. All rights reserved.
//

#import "HttpServers.h"

@implementation HttpServers


+(void)RequestDataWithResponseHandler:(responseHandler)Handler
{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    [params setObject:@"1111" forKey:@"id"];
    NSString *url=[NSString stringWithFormat:@"%@%@",Host,KHTTP_USERINFO];
    [super postWithUrl:url param:params resultClass:[UserInfoModel class] responseBlock:Handler];
}

@end
