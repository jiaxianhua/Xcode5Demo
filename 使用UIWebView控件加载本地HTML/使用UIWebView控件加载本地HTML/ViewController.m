//
//  ViewController.m
//  使用UIWebView控件加载本地HTML
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
    
    // 初始化UIWebView对象。并设定UIWebView对象的位置和尺寸。
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(20, 100, 2000, 100)];
    // 新建一个HTML字符串。
    NSString *htmlString = @"<font color='red'>Hello</font> <b>IOS</b> <i>Programmer</i>";
    // 使用UIWebView对象加载这个HTML字符串。
    [webView loadHTMLString:htmlString baseURL:nil];
    
    // 将UIWebView添加到当前窗口的根视图。
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
