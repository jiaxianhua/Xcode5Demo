//
//  ViewController.m
//  同步Post方式的网络请求
//
//  Created by GnuHua on 14-7-31.
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

    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];

    // 设置http通信方式为POST,默认为GET。
    [request setHTTPMethod:@"POST"];
    // 设置参数。
    NSString *str = @"type=focus-c";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    // 使用NSURLConnection实现http通信，NSURLConnection创建成功后，就创建了一个http连接。
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    // 将返回的数据转换成NSString字符串。
    NSString *str1 = [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", str1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
