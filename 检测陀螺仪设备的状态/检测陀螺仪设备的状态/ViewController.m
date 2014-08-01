//
//  ViewController.m
//  检测陀螺仪设备的状态
//
//  Created by GnuHua on 14-8-1.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    BOOL isGyroscopeAvailable = [self isGyroscopeAvailable];
    NSLog(@"-----------%d", isGyroscopeAvailable);
}

#pragma mark - 添加一个方法，用来检测陀螺仪的状态，返回结果为布尔值。
- (BOOL)isGyroscopeAvailable
{
    // 判断系统版本是否为IOS4.0以上。之前的IOS版本并没有包含Core Motion框架。
#ifdef __IPHONE_4_0
    // 初始化CMMotionManager对象。
    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    // 获得陀螺仪设备是否可用。
    BOOL gyrascopeAvailable = motionManager.gyroAvailable;
    
    return gyrascopeAvailable;
#else
    // 系统低于4.0，返回NO。
    return NO;
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
