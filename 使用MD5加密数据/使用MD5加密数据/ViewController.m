//
//  ViewController.m
//  使用MD5加密数据
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonCrypto.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *str = @"Hello Apple!";
    // 将NSString转换为c语言字符串。
    const char *representation = [str UTF8String];
    
    // 创建一个md5标准长度的字符串。
    unsigned char md5[CC_MD5_DIGEST_LENGTH];
    // 对c语言字符串进行md5加密，并将结果存入md5变量中。
    CC_MD5(representation, strlen(representation), md5);
    
    NSMutableString *mutableStr = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
    {
        // 通过遍历md5变量，将结果转为Object-C的可变字符串变量里。
        [mutableStr appendFormat:@"%02x", md5[i]];
    }
    
    // 使用UIAlertView显示加密后的md5值。
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"MD5" message:mutableStr delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
