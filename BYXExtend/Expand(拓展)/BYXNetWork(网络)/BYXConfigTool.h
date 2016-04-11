//
//  BYXConfigTool.h
//  封装网络库
//
//  Created by bianyixuan on 16/4/8.
//  Copyright (c) 2016年 bianyixuan. All rights reserved.
//  该类用于解析配置文件 plist 或者json

#import <UIKit/UIKit.h>
/**
 *  定义协议
 */
@protocol YKConfigServiceDelegate <NSObject>

@optional

/**
 *  如果代理实现了配置文件读取的方法 优先走代理（可选实现）
 */
-(NSDictionary *)configFromName:(NSString *)strName configType:(NSString *)fileType;

@end


@interface BYXConfigTool : NSObject

// 根据文件名读取一个配置文件的内容
+(NSDictionary *)getConfigWithName:(NSString *)strName configType:(NSString *)fileType;

// 从配置文件中获取网络请求的头部host
+(NSString *)getLocalHostNameWithClassName:(NSString *)className;

@end
