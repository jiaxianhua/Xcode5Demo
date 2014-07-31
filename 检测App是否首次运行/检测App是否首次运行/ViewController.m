//
//  ViewController.m
//  检测App是否首次运行
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
    
    // NSUserDefaults用于存储App设置。当你关闭App之后再打开，之前存储的setting依然可以从NSUserDefaults里读取。
    
    // 获得everLaunched变量布尔值，当App首次启动时，由于从未设置过此变量，所以它的值是NO.
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"])
    {
        // 将everLaunched变量赋值为YES。
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        // 使用synchronize方法，立即保存修改。
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        // 对于首次运行的App,可以根据业务需要进行各种初始工作。这里使用一个简单的弹出窗口。
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"It's first show" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello Again" message:@"It's not the first show" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
