//
//  ViewController.m
//  UILabel文本标签的使用
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
    
    // 初始化UILabel对象，并指定其位置和尺寸。
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 100, 150, 80)];
    // 设置UILabel对象的标题。
    [label setText:@"Hello!"];
    // 设置UILabel对象文字的字体和大小。
    UIFont *font = [UIFont fontWithName:@"Arial" size:48];
    [label setFont:font];
    // 设置UILabel对象的阴影颜色。
    [label setShadowColor:[UIColor grayColor]];
    // 设置UILabel对象的阴影偏移距离。
    [label setShadowOffset:CGSizeMake(2, 2)];
    // 设置UILabel文字的对齐方式。
    label.textAlignment = NSTextAlignmentRight;
    // 设置UILabel文字的颜色。
    label.textColor = [UIColor blueColor];
    
    // 设置UILabel文字的背影颜色。
    [label setBackgroundColor:[UIColor yellowColor]];
    // 将UILabel对象添加到当前窗口的根视图。
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
