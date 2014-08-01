//
//  ViewController.m
//  给方法添加标注
//
//  Created by GnuHua on 14-8-1.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - 
// 给viewDidLoad方法添加 #pragma mark 编译器指令。右边 - 表示将在方法列表中显示一条分隔线。
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self addImage];
}

#pragma mark - 添加方法注释
- (void)addImage
{
    UIImage *image = [UIImage imageNamed:@"pic"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(60, 100, 206, 284)];
    [self.view addSubview:imageView];
}

#pragma mark -
#pragma mark didReceiveMemoryWarning
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
