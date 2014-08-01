//
//  ViewController.m
//  App内容文本的国际化
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

    // NSLocalizedString是一个宏，本质上是调用了函数localizedStringForKey,查找资源文件名键值label所指向的字符串。
    NSString *str = NSLocalizedString(@"label", @"");
    // 创建一个UILabel对象，用来显示获得的字符串。
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(130, 100, 250, 60);
    label.text = str;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
