//
//  ViewController.m
//  UILabel文本标签的自动换行
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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 150)];
    // 给UILabel对象设置一段较长的文本内容。
    label.text = @"Love you, think of you, love you secretly, eagerly love you, wait, fell disappointed, try hard, lose, and feel sad, go apart, and recall. All of these are for sake of you. And I will never regret for it.";
    
    // 设置UILabel的背景颜色。
    label.backgroundColor = [UIColor brownColor];
    // 设置UILabel文字的颜色。
    label.textColor = [UIColor whiteColor];
    // 设置UILabel文字的对齐方式。
    label.textAlignment = NSTextAlignmentLeft;
    
    // 设置UILabel文字的换行方式为以空格为界，保留整个单词。
    label.lineBreakMode = NSLineBreakByWordWrapping;
    // 设置UILabel不限制行数。
    label.numberOfLines = 0;
    
    // 将UILabel对象添加到当前窗口的根视图。
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
