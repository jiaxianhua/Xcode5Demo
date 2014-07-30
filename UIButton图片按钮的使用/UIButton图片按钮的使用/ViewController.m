//
//  ViewController.m
//  UIButton图片按钮的使用
//
//  Created by GnuHua on 14-7-30.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property UIImage *img;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 设置按钮的位置和尺寸。
    CGRect rect = CGRectMake(120, 100, 82, 82);
    // 初始化一个UIButton对象。
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    
    // 加载之前导入的图片。
    UIImage *img = [UIImage imageNamed:@"jiaxianhua60"];
    // 将图片指定按钮的正常状态。也可以给按钮的按下状态，失效状态指定各自的图片。
    [button setImage:img forState:UIControlStateNormal];
    
    // 清除按钮的颜色。
    UIColor *color = [UIColor clearColor];
    [button setBackgroundColor:color];
    
    // 给按钮添加点击事件。
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 将按钮添加到当前视图的根视图。
    [self.view addSubview:button];
}

// - 添加一个方法，执行按钮的点击事件。
- (void)buttonClick:(id)button
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:@"You tapped me" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
