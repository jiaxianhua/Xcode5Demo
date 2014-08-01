//
//  ViewController.m
//  正则表达式的使用
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

    // 创建一个NSString对象，内容为一个邮箱字符串。
    NSString *str = @"jiaxianhua@gmail.com";
    // NSRegularExpression这个类，帮助检测字符串是否匹配正则表达式。
    NSRegularExpression *regexEmail = [NSRegularExpression
                                       regularExpressionWithPattern:@"^(\\w)*(\\.\\w*)*@(\\w)*((\\.\\w{2,3}){1,3})$"
                                       options:0
                                       error:nil];
    // 返回第一个匹配的结果，注意，匹配的结果保存在NSTextCheckingResult类型中。
    NSTextCheckingResult *isEmail = [regexEmail firstMatchInString:str options:0 range:NSMakeRange(0, [str length])];
    
    // 根据结果做为相应的处理。
    if (isEmail)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Perfect!" message:@"It's an email!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"It's not an email!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
