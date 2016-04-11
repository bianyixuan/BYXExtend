//
//  userInfoModel.h
//  网络请求demo
//
//  Created by bianyixuan on 16/4/6.
//  Copyright © 2016年 caoxiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;
@interface UserInfoModel : NSObject


@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) Data *data;

@property (nonatomic, assign) NSInteger status;


@end
@interface Data : NSObject

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *name;

@end

