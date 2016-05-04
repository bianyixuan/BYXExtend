//
//  AppDelegate.m
//  BYXExtend
//
//  Created by bianyixuan on 16/4/7.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

#import "AppDelegate+AppService.h"
#import "AppDelegate+RootController.h"
#import "AppDelegate+AppLifeCircle.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self setAppWindows];
    
    [self setRootViewController];
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
