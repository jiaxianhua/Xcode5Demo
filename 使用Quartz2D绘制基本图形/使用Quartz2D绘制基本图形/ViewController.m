//
//  ViewController.m
//  使用Quartz2D绘制基本图形
//
//  Created by GnuHua on 14-8-1.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"
#import "QuartzView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // 设定视图显示区域。
    CGRect rect = self.view.bounds;
    // 初始化QuartzView的对象。
    QuartzView *view = [[QuartzView alloc] initWithFrame:rect];
    
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
