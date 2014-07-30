//
//  ViewController.m
//  UIAlertView警示窗口的使用
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
    
    // 初始化UIAlertView对象，并指定标题，内容，代理，取消按钮的文字，及其它按钮等。
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Have a nice day!"
                                                   delegate:self cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    // 显示UIAlertView对象。
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
