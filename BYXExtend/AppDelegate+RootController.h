//
//  AppDelegate+RootController.h
//  BYXExtend
//
//  Created by bianyixuan on 16/5/3.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (RootController)

/**
 * 首次启动轮播图
 */
-(void)createLoadingScrollView;

/**
 * tabBar实例
 */
-(void)setTabBarController;

/**
 * window实例
 */
-(void)setAppWindows;

/**
 * 根视图
 */
-(void)setRootViewController;

@end
