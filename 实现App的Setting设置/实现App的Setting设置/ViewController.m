//
//  ViewController.m
//  实现App的Setting设置
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

    // NSUserDefaults类提供了一个与系统进行交互的编程接口。NSUserDefaults对象可以保存，恢复应用程序相关的偏好设置，配置数据等。
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 通过在plist文件中设置的 article_preference 健，读取对应的值。
    NSString *article = [defaults objectForKey:@"article_preference"];
    BOOL visible = [defaults boolForKey:@"visible_preference"];
    float value = [defaults floatForKey:@"value_preference"];
    
    NSString *message = [NSString stringWithFormat:@"Article:%@\n Visible:%d\n Value:%f", article, visible, value];
    
    // 使用UIAlertView弹出信息窗口，显示设置的数据。
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Settings Information" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
