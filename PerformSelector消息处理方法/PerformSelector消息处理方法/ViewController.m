//
//  ViewController.m
//  PerformSelector消息处理方法
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"
#import "IOSApp.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 初始化一个类对象。
    IOSApp *app = [[IOSApp alloc] init];
    
    // @selector()可以理解成取类方法的编号，它的行为基本可以等同C语言的中函数指针。它的结果是一个SEL类型。
    SEL method = @selector(printInformation);
    
    // reapondsToSelector方法，用来判断是否有以某个名字命名的方法（被封装在一个selector的里传递）。
    if ([app respondsToSelector:method])
    {
        [app performSelector:method];
        [app performSelector:method];
    }
    
    // performSelector是运行时系统负责去找方法的，在编译时候不做任何校验。
    SEL method2 = @selector(buyApp:);
    // performSelector方法和普通的函数调用相比，还可以增加延迟执行功能。
    if ([app respondsToSelector:method2])
    {
        [app performSelector:method2 withObject:@"IOS App Demos"];
        [app performSelector:method2 withObject:@"IOS App Demos" afterDelay:2];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
