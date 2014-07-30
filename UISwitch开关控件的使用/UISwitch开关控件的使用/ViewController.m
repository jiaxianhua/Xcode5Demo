//
//  ViewController.m
//  UISwitch开关控件的使用
//
//  Created by GnuHua on 14-7-30.
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
    
    // 创建一个CGRect对象，作为UISwitch对象的位置和尺寸。
    CGRect rect = CGRectMake(130, 100, 0, 0);
    // 初始化UISwitch对象，并指定其位置和尺寸。
    UISwitch *uiSwitch = [[UISwitch alloc] initWithFrame:rect];
    // 设置UISwitch对象的当前状态为选中。
    [uiSwitch setOn:YES];
    // 给UISwitch对象添加状态变化事件。
    [uiSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    
    // 将UISwitch对象添加到当前窗口的根视图。
    [self.view addSubview:uiSwitch];
}

#pragma mark - 添加一个方法，用来处理UISwitch事件。
- (void)switchChanged:(UISwitch *)uiSwitch
{
    // 获取UISwitch对象的状态，并根据状态执行不同的动作。
    if ([uiSwitch isOn]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Turn on the switch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Turn off the switch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
