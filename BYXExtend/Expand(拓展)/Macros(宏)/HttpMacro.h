//
//  HttpMacro.h
//  BYXExtend
//
//  Created by bianyixuan on 16/4/7.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//  定义一些网络请求url相关的宏


#import <Foundation/Foundation.h>


//============切换App环境============

#define Dev
//#define Testing
//#define Product

#ifdef Dev

#define Host @"http://rap.taobao.org/mockjs/2413/"

#endif


//===========Home相关url==============


#define KHTTP_USERINFO @"userInfo"  //用户信息请求url




//===========Profile相关url==============




//===========Setting相关url==============


