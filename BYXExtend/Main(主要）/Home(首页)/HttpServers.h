//
//  HomeServers.h
//  网络请求demo
//
//  Created by bianyixuan on 16/4/6.
//  Copyright © 2016年 caoxiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
#import "BYXServiceBaseTool.h"
@interface HttpServers : BYXServiceBaseTool


+(void)RequestDataWithResponseHandler:(responseHandler)Handler;



@end
