//
//  ViewController.m
//  UIButton控件的使用
//
//  Created by GnuHua on 14-7-29.
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
    
    // 创建一个深色背影的 information button.
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeInfoDark];
    // 设置按钮的位置和尺寸。
    btn1.frame = CGRectMake(130, 80, 40, 40);
    
    // 创建一个普通的圆角按钮。
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    // 设置按钮的位置和尺寸。
    btn2.frame = CGRectMake(80, 180, 150, 30);
    // 设置按钮的背景颜色。
    btn2.backgroundColor = [UIColor purpleColor];
    // 设置按钮的前景颜色。
    btn2.tintColor = [UIColor yellowColor];
    // 设置按钮的标签文字。
    [btn2 setTitle:@"Tap me" forState:UIControlStateNormal];
    // 绑定按钮的点击事件。
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 再创建一个圆角按钮。
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    // 设置按钮的背影颜色。
    btn3.backgroundColor = [UIColor brownColor];
    // 设置按钮的前景颜色。
    btn3.tintColor = [UIColor yellowColor];
    // 设置按钮的标签文字。
    [btn3 setTitle:@"Tap it" forState:UIControlStateNormal];
    // 设置按钮的位置和尺寸。
    btn3.frame = CGRectMake(80, 280, 150, 30);
    // 给按钮添加边框效果。
    [btn3.layer setMasksToBounds:YES];
    // 设置圆角半径。
    [btn3.layer setCornerRadius:10.0];
    // 设置边框宽度。
    [btn3.layer setBorderWidth:20];
    // 设置边框颜色。
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){1, 1, 0, 1});
    [btn3.layer setBorderColor:colorref];
    
    // 将三个按钮添加到当前窗口的根视图。
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
}

#pragma mark - 添加一个方法，用来响应按钮的点击事件。
- (void)btnClick:(id)button
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:@"UIButton Event" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
