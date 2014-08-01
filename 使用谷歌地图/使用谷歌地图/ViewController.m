//
//  ViewController.m
//  使用谷歌地图
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
    
    [self openMaps];
}

// 定义一个方法，用来实现打开谷歌地图的功能。
- (void)openMaps
{
    // 定义一个字符串，作为谷歌地图的当前地理位置。
    NSString *addressText = @"Shenzhen";
    // 请求的URL中，如果包含中文的话会出现请求不成功的情况，这里需要将中文参数转为ASCII码。
    addressText = [addressText stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    // 定义一个完整的URL路径。
    NSString *urlText = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", addressText];
    NSLog(@"urlText : %@", urlText);
    
    // 获取UIApplication单例对象，然后调用openURL方法，打开一个网站。
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlText]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
