//
//  ViewController.m
//  NSLoop的延时动作
//
//  Created by GnuHua on 14-8-1.
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
    
    CGRect rect = CGRectMake(100, 100, 100, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    [label setText:@"Waiting..."];
    // 给标签添加一个tag值，后面会再用到这个标签。
    [label setTag:1];
    
    [self.view addSubview:label];
    
    // 1秒后，执行threadEvent方法。
    [self performSelector:@selector(threadEvent) withObject:nil afterDelay:1.0f];
}

- (void)threadEvent
{
    // 2秒钟后，执行workInBackground方法。
    [self performSelector:@selector(workInBackground) withObject:nil afterDelay:2.0f];
    
    // 初始化布尔应是为true。
    _stillloading = true;

    while (_stillloading)
    {
        // 这条语句将使方法一直停留在本行直到布尔变量为false时，才跳转到下面的代码。以此实现线程阻塞。
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    
    //  2秒钟后，隐藏Loading标签。
    [[self.view viewWithTag:1] setHidden:YES];
}

- (void)workInBackground
{
    // 输出一条日志，用来标识线程运行状态。
    NSLog(@"-------------------");
    _stillloading = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
