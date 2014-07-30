//
//  ViewController.m
//  UIDatePicker日期时间选择器
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
    
    // 初始化UIDatePicker对象。
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    // 设置UIDatePicker对象的中心点位置。
    [datePicker setCenter:CGPointMake(160, 200)];
    // 设置UIDatePicker的tag值，以便将来再次使用它。
    [datePicker setTag:1];
    // 将UIDatePicker对象添加到当前窗口的根视图。
    [self.view addSubview:datePicker];
    
    CGRect rect = CGRectMake(110, 360, 100, 30);
    // 添加一个按钮，当点击按钮时，获取UIDatePicker对象的值。
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button setTitle:@"Select" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor purpleColor]];
    [button addTarget:self action:@selector(getDate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - 添加一个方法，用来执行按钮点击事件。
- (void)getDate
{
    // 通过tag值获得当前UIDatePicker对象。
    UIDatePicker *datePicker = (UIDatePicker *)[self.view viewWithTag:1];
    // 获得UIDatePicker的日期。
    NSDate *select = [datePicker date];
    // 新建一个NSDateFormatter对象，用来实现日期的格式化。
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 设置日期格式。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    // 将日期转换为字符串。
    NSString *dateAndTime = [dateFormatter stringFromDate:select];

    // 使用UIAlertView显示日期结果。
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Date"
                          message:dateAndTime
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil,
                          nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
