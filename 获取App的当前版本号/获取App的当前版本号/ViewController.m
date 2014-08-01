//
//  ViewController.m
//  获取App的当前版本号
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

    // 通过NSBundle获取App配置信息的数据字典。
    
    // 通过CFBundleVersion键获取当前App的版本号。大家可以查看项目的info.plist文件，查看有哪些键可以查询。
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *versionNumber = [infoDic objectForKey:@"CFBundleVersion"];
    NSString *appVersion = [NSString stringWithFormat:@"Version: %@", versionNumber]    ;
    

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:appVersion delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
