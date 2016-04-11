//
//  ViewController.m
//  BYXExtend
//
//  Created by bianyixuan on 16/4/7.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "HomeViewController.h"
#import "HttpServers.h"
@interface HomeViewController ()

@end

@implementation HomeViewController


#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadNetData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CustomDelegate

#pragma mark - event response

#pragma mark - private methods

//数据请求
-(void)loadNetData
{
    [HttpServers RequestDataWithResponseHandler:^(UserInfoModel *dataObj, NSError *error) {
        
        if (dataObj) {
            NSLog(@"name:%@",dataObj.data.name);
        }else{
            NSLog(@"网络连接错误");
        }
    }];
}

#pragma mark - getters and setters

-(NSString *)title
{
    return @"首页";
}

@end
