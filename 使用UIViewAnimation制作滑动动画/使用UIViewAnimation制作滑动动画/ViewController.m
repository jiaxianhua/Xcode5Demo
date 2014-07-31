//
//  ViewController.m
//  使用UIViewAnimation制作滑动动画
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
    
    // 发出beginAnimations请求，标志着UIView动画块的开始。在它和commitAnimations请求的之间，可定义动画的展现方式。
    [UIView beginAnimations:@"Animation" context:nil];
    // 设置动画时长。
    [UIView setAnimationDuration:2];
    // 设置动画播放速度类型为由快至慢。
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    // 设置动画类型为翻转动画。
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    
    UIImage *image = [UIImage imageNamed:@"pic"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(60, 100, 206, 284);
    [self.view addSubview:imageView];
    
    // commitAnimations标志着动画块的结束。
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
