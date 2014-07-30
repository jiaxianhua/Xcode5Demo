//
//  ViewController.m
//  UITextField控件的使用
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
    
    // 创建一个CGRect变量，作为UITextField对象的位置和尺寸。
    CGRect rect = CGRectMake(100, 80, 150, 30);
    // 初始化UITextField对象，并指定其位置和尺寸。
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    
    // 设置UITextField对象的边框样式。
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    // placeholder属性描述输入字段预期值的提示信息(hint)。该提示会在输入字段为空时显示并会在字段获得焦点时消失。
    textField.placeholder = @"Your name";
    // 关闭UITextField对象的语法错误提示功能。
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    // 设置UITextField对象的键盘自动大小写属性。
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    // 设置键盘上回车按钮的类型。
    textField.returnKeyType = UIReturnKeyDone;
    // 设置UITextFiled对象右边显示的清除按钮。
    textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    // 设置UITextField对象的代理。
    textField.delegate = self;
    // 也可以给UITextField对象设置初始值。
    [textField setText:@"Hello World!"];
    
    // 将UITextField对象添加到当前窗口的根视图。
    [self.view addSubview:textField];
}

#pragma mark - 点击Return时隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
