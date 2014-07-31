//
//  ViewController.m
//  读取和解析Plist属性列表文件
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
    
    // 获取plist文件的路径。
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PropertyList" ofType:@"plist"];

    // 读取plist文件，并存入一个字典对象中。
//    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    // 将字典对象转换为字符串对象。
    NSString *message = [data description];
    
    // 使用UIAlertView信息窗口，显示出plist文件的所有内容。
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Plist Content" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
