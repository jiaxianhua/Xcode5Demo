//
//  ViewController.m
//  使用CATransition制作移动渐显动画
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
    
    // 这里使用CGTransition创建常见的渐显动画。
    CGRect rect = CGRectMake(55, 100, 206, 284);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    
    // 创建一个简单的UIImageView，作为动画的载体。
    UIImage *image = [UIImage imageNamed:@"pic"];
    [imageView setImage:image];
    
    // 将UIImageView添加到当前窗口的根视图。
    [self.view addSubview:imageView];
    
    // 初始化一个CATransaction实例。
    CATransition *animation = [CATransition animation];
    // 设置动画时长。
    [animation setDuration:2];
    // 设置动画播放速度类型为由慢至快。
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    // 设置动画类型为Push移动动画。
    [animation setType:kCATransitionPush];
    
    // 将动画指定给UIImageView对象的CALayer层。
    [imageView.layer addAnimation:animation forKey:@"Push"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
