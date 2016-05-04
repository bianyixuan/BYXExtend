//
//  AppDelegate+RootController.m
//  BYXExtend
//
//  Created by bianyixuan on 16/5/3.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "AppDelegate+RootController.h"
#import "HomeViewController.h"
@implementation AppDelegate (RootController)


-(void)createLoadingScrollView
{
    
}

-(void)setTabBarController
{
    
}

-(void)setAppWindows
{
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
}


-(void)setRootViewController
{
    HomeViewController *homeVC=[[HomeViewController alloc] init];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController=nav;
}

@end
