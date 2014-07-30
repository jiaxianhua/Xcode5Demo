//
//  ViewController.m
//  UIStepper控件的使用
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
    
    // 创建一个CGRect变量，作为UILabel对象的位置和尺寸。
    CGRect frame1 = CGRectMake(80, 100, 100, 30);
    // 初始化UILabel对象，用来裡显示UIStepper的值。
    UILabel *label = [[UILabel alloc] initWithFrame:frame1];
    // 设置UILabel的初始值。
    [label setText:@"0"];
    // 设置UILabel的tag值，方便将来再次调用UILabel。
    label.tag = 1;
    [self.view addSubview:label];
    
    CGRect frame2 = CGRectMake(130, 100, 0, 0);
    // 初始化UIStepper对象。
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:frame2];
    // 初始化UIStepper对象大小自适应。
    [stepper sizeToFit];
    // 设置UIStepper的tag值，方便将来再次调用UIStepper。
    stepper.tag = 2;
    // 设置UIStepper的默认值。
    stepper.value = 0;
    // 设置UIStepper的最小值。
    stepper.minimumValue = 0;
    // 设置UIStepper的最大值。
    stepper.maximumValue = 10;
    // 设置UIStepper每次递增或递减的值。
    stepper.stepValue = 1;
    
    // 给UIStepper对象添加状态变化事件。
    [stepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
    // 将UIStepper对象添加到当前窗口的根视图。
    [self.view addSubview:stepper];
}

#pragma mark - 添加一个方法，用来处理UIStepper事件。
- (void)stepperValueChanged:(UIStepper *)sender
{
    // 获得UIStepper对象的值。
    int stepValue = sender.value;
    // 通过tag值，获取UILabel对象。
    UILabel *label = (UILabel *)[self.view viewWithTag:1];
    // 修改UILabel的广本内容。
    [label setText:[NSString stringWithFormat:@"%d", stepValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
