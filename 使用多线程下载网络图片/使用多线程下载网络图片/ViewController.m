//
//  ViewController.m
//  使用多线程下载网络图片
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

    NSString *url = @"http://images.apple.com/v/creativity-apps/a/images/icon_mac_garageband_2x.jpg";
    // 使用NSThread的detachNewThreadSelector方法创建一个线程，用来执行downloadImage方法。
    [NSThread detachNewThreadSelector:@selector(downloadImage:) toTarget:self withObject:url];
}

- (void)downloadImage:(NSString *)url
{
    // 初始化加载状态和NSMutableData对象。
    _isLoaded = NO;
    _bufferData = [NSMutableData data];
    
    // 清除response缓存。
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    // 建立网络请求。
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    // 建立网络请求连接。
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection != nil)
    {
        while (!_isLoaded)
        {
            NSLog(@"Downloading...");
            // 将请求返回的数据，转换为UIImage对象。
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
    }
    
    UIImage *image = [UIImage imageWithData:_bufferData];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setCenter:CGPointMake(150, 200)];
    // 在当前窗口显示网络下载的图片。
    [self.view addSubview:imageView];
    
    // 清除网络请求对象和网络连接对象。
    request = nil;
    connection = nil;
}

#pragma mark - 添加一个方法，处理网络连接结束事件。
- (void)httpConnectEnd
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - 添加一个方法，处理网络连接故障事件。
- (void)httpConnectEndWithError
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - 添加一个代理方法，处理网络连接缓存事件，这里选择不缓存。
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    return nil;
}

#pragma mark - 添加一个代理方法，处理网络连接故障事件。
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self performSelectorOnMainThread:@selector(httpConnectEndWithError) withObject:self waitUntilDone:NO];
    [_bufferData setLength:0];
}

#pragma mark - 添加一个代理方法，处理接收网络数据事件。将返回的数据存入NSMutableData对象。
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_bufferData appendData:data];
}

#pragma mark - 添加一个代理方法，处理网络连接结束事件。
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self performSelectorOnMainThread:@selector(httpConnectEnd) withObject:nil waitUntilDone:NO];
    self.isLoaded = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
