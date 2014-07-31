//
//  ViewController.m
//  退出系统前的事件处理
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 通过使用IOS通知中心，实现监听并处理App退出事件功能。
    
    // 获得UIApplication单例对象。
    UIApplication *app = [UIApplication sharedApplication];
    // NSNotificationCenter是Foundation框架的子系统。它向所有监听程序退出事件的对象广播消息。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

#pragma mark - 创建方法，使用程序退出前保存数据功能。
- (void)applicationWillResignActive:(id)sender
{
    NSLog(@"---------- Saving data before exit.");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
