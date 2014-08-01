//
//  ViewController.m
//  检测网络的连接状态
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"

#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 获得网络检测结果。
    BOOL canConnectNetwork = [self isExistenceNetwork];
    NSLog(@"Can connect network ? ------%d", canConnectNetwork);
}

#pragma mark - 检测网络状态
- (BOOL)isExistenceNetwork
{
    BOOL isExistenceNetwork;
    // 测试网络是否可以连接苹果官网。对于使用IAP的朋友，可以用它来检测是否可以连接itunes。
    Reachability *r = [Reachability reachabilityWithHostName:@"http://www.baidu.com"];
    // 对于网络连接状态进行遍历。
    switch ([r currentReachabilityStatus])
    {
            // 表示网络不可用。
        case NotReachable:
            isExistenceNetwork = FALSE;
            break;
            // 表示当前网络通过2g or 3g连接。 
        case ReachableViaWWAN:
            isExistenceNetwork = TRUE;
            break;
            // 表示当前网络通过Wifi连接。
        case ReachableViaWiFi:
            isExistenceNetwork = TRUE;
            break;
        default:
            break;
    }
    
    return isExistenceNetwork;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
