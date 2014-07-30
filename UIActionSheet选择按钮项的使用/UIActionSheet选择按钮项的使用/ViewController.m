//
//  ViewController.m
//  UIActionSheet选择按钮项的使用
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
    
    // 添加一个按钮，当点击按钮时，弹出信息提示窗口。
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(80, 100, 150, 35)];
    [button setTitle:@"Show Sheet" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor purpleColor]];
    [button addTarget:self action:@selector(showSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - 添加一个方法，用来执行按钮点击事件。
- (IBAction)showSheet:(id)sender
{
    // 初始化一个UIActionSheet对象，指定它的标题，代理，取消按钮的文字及三个选项按钮的属性。
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Food time!"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:@"Breakfast"
                                  otherButtonTitles:@"Lunch", @"Dinner",nil];
    // 设置UIActionSheet对象的样式。
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    actionSheet.title = @"Food time!";
    // 显示UIActionSheet信息窗口。
    [actionSheet showInView:self.view];
}

#pragma mark - 添加一个代理方法，用来处理UIActionSheet窗口中按钮点击的事件。
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSLog(@"--------------> You Selected food for Breakfast.");
    }
    else if (buttonIndex == 1)
    {
        NSLog(@"--------------> You Selected food for Lunch.");
    }
    else if (buttonIndex == 2)
    {
        NSLog(@"--------------> You Selected food for Dinner.");
    }
    else if (buttonIndex == 3)
    {
        NSLog(@"--------------> No choose.");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
