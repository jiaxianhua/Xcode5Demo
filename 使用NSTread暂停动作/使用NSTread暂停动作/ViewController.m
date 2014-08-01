//
//  ViewController.m
//  使用NSTread暂停动作
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
    
    // 让线程在viewDidLoad方法时休眠2秒，此时界面将持续显示App启动图片2秒钟。
    [NSThread sleepForTimeInterval:2];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
