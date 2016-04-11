//
//  BYXConfigTool.m
//  封装网络库
//
//  Created by bianyixuan on 16/4/8.
//  Copyright (c) 2016年 bianyixuan. All rights reserved.
//  该类用于解析配置文件 plist 或者json
//

#import "BYXConfigTool.h"

@interface BYXConfigTool (){
    /** 从plist或者json中读取后的缓存字典 */
    NSMutableDictionary *m_dictConfigCache;
}

@end

@implementation BYXConfigTool

+(instancetype)config
{
    return [[self alloc] init];
}


+(NSDictionary *)getConfigWithName:(NSString *)strName configType:(NSString *)fileType
{
    return [[[self alloc] init] getConfigWithName:strName configType:fileType];
}


#pragma mark - 私有方法
-(NSDictionary *)getConfigWithName:(NSString *)strName configType:(NSString *)fileType
{
    NSDictionary *pDict;
    
    id<YKConfigServiceDelegate>  configServer = (id<YKConfigServiceDelegate>)[UIApplication sharedApplication].delegate;
    if ([configServer respondsToSelector:@selector(configFromName:configType:)]) {
        pDict = [configServer configFromName:strName configType:fileType];
        if (pDict) {
            return pDict;
        }
    }
    
    pDict = [self dictFromConfigName:strName configType:fileType];
   
    if (!pDict) { // 最后读自己的settings问价
        pDict = [self dictFromConfigName:@"settings" configType:@"plist"];
        if (pDict) {
            pDict = [pDict objectForKey:strName];
        }
    }
    
    return pDict;
}


#pragma mark - 私有方法 专门负责根据名字读取plist或者json
-(NSDictionary *)dictFromConfigName:(NSString *)configName configType:(NSString *)fileType
{
    NSDictionary *pDict = NULL;
    NSString *path;
    
    // m_dictConfigCache缓存字典
    if (!m_dictConfigCache) {
        m_dictConfigCache = [NSMutableDictionary dictionary];
    }
    
    pDict = [m_dictConfigCache objectForKey:configName];
    
    if (pDict) {
        return pDict;
    }
    
    NSFileManager *fmgr = [NSFileManager defaultManager];
    path = [[NSBundle mainBundle] pathForResource:configName ofType:fileType];
    if (!(path && [fmgr fileExistsAtPath:path])) return nil;
    
    if ([fileType isEqualToString:@"plist"]) {
        pDict = [[NSDictionary alloc] initWithContentsOfFile:path];
        
    } else if ([fileType isEqualToString:@"json"]) {
        NSData *jsonData = [NSData dataWithContentsOfFile:path];
        pDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    }
    
    if (pDict) {
        [m_dictConfigCache setObject:pDict forKey:configName];
    }
    
    return pDict;
}

+(NSString *)getLocalHostNameWithClassName:(NSString *)className
{
    return [BYXConfigTool getConfigWithName:@"Settings" configType:@"plist"][@"host"];
}



@end
