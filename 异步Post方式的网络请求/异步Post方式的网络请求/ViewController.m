//
//  ViewController.m
//  异步Post方式的网络请求
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
    
    // 建立一个NSURL对象，指定请求数据的网址，本节将调用Facebook的公用API,获得某个Facebook用户的信息。
    //    NSURL *url = [NSURL URLWithString:@"http://graph.facebook.com/Apple-Inc"];
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    
    // 通过NSURL创建NSURLRequest。第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间。
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];

    // 设置http通信方式为POST,默认为GET。
    [request setHTTPMethod:@"POST"];
    // 设置参数。
    NSString *str = @"type=focus-c";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    // 使用NSURLConnection实现http通信，NSURLConnection创建成功后，就创建了一个http连接。
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]   ;
    
}

#pragma mark - 添加一个代理方法，当接收到网络反馈时执行这个方法。
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.receiveData = [NSMutableData data];
}

#pragma mark - 添加一个代理方法，当接收到网络数据时执行这个方法。
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    self.receiveData = data;
}

#pragma mark - 添加一个代理方法，当网络连接的一系列动作结束后，执行这个方法。
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 将接收到的网络数据，从NSData格式转换为NSString格式，并在日志区输出结果。
    NSString *receiveStr = [[NSString alloc] initWithData:self.receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"------------- %@", receiveStr);
}

#pragma mark - 添加一个代理，当网络连接失败时执行这个方法。
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
