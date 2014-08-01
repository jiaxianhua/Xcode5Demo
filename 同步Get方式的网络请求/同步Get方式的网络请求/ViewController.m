//
//  ViewController.m
//  同步Get方式的网络请求
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
    
    // 通过Get请求，同步获取网络数据。一旦发送同步请求程序将停止用户交互，走至服务器返回数据完成。
    
    // 建立一个NSURL对象，指定请求数据的网址。
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    // 再通过NSRUL创建NSURLRequest。第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间。
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    // 使用NSURLConnection实现http通信，NSURLConnection创建成功后，就创建了一个http连接。
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    // 将返回的数据转成NSString字符串。
    NSString *str = [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", str);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
