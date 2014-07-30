//
//  ViewController.m
//  使用UIWebView控件加载网页
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
    
    // 创建一个CGRect变量，作为UIWebView对象的位置和尺寸。
    CGRect webFrame = CGRectMake(0, 20, 320, 460);
    // 初始化UIWebView对象。
    UIWebView *webView = [[UIWebView alloc] initWithFrame:webFrame];
    // 创建一个NSURL对象，作为UIWebView对象的网址。
    NSURL *url = [NSURL URLWithString:@"http://www.jiaxh.com"];
    // 创建一个NSURLRequest对象，作为UIWebView对象网络请求。
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    // UIWebView加载网址。
    [webView loadRequest:requestObj];
    
    // 将UIWebView添加到当前窗口的根视图。
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
