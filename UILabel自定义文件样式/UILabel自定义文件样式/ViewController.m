//
//  ViewController.m
//  UILabel自定义文件样式
//
//  Created by GnuHua on 14-7-30.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"

// 导入NewUILabel头文件。
#import "NewUILabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 初始化NewUILabel对象，并设置Label文字内容。
    NewUILabel *label = [[NewUILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 60)];
    [label setText:@"Apple"];
    // 设置文字的字体和大小。
    label.font = [UIFont fontWithName:@"Arial" size:48];
    
    // 将文字添加到当前窗口的根视图。
    [self.view addSubview:label];
    // 设置当前窗口的根视图背景颜色。
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
