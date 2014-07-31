//
//  ViewController.m
//  通过代码创建Plist文件
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
    
    // 初始化一个可变字典对象，作为plist内容的窗口。
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    // 设置plist文件的内容。
    [data setObject:@"Jiaxh" forKey:@"Name"];
    [data setObject:[NSNumber numberWithInt:27] forKey:@"Age"];
    
    // 获得Documents文件夹路径。
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    // 生成plist文件实际路径。
    NSString *filename = [plistPath1 stringByAppendingPathComponent:@"demoPlist.plist"];
    // 将可变字典对象写入plist文件。
    [data writeToFile:filename atomically:YES];
    
    // 读取并显示plist文件。
    NSMutableDictionary *data2 = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    NSString *message = [data2 description];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Plist Content" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
