//
//  ViewController.m
//  使用UIApplication拨打电话
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

    // 创建一个字符串，注意它的格式。
    NSString *string = @"tel:15889629702";
    // 转换成NSURL对象。
    NSURL *url  = [NSURL URLWithString:string];
    // 获取UIApplication单例对象，使用它的openURL功能调出通信面板（需要Mac连接iPhone进行测试）。
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
