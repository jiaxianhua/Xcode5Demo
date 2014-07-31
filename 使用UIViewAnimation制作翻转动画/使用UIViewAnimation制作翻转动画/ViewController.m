//
//  ViewController.m
//  使用UIViewAnimation制作翻转动画
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
    
    // 初始化UIImageView对象，作为动画的载体。
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 206, 284)];
    self.imageView.image = [UIImage imageNamed:@"pic"];
    [self.view addSubview:self.imageView];
    
    // 新建一个按钮，用来触发动画事件。
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 400, 140, 35)];
    [button setBackgroundColor:[UIColor brownColor]];
    [button setTitle:@"Tap" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

#pragma mark - 创建点击按钮所触发的事件方法。
- (void)buttonClick
{
    // 发出beginAnimations请求，标志着UIView动画块的开始。在它和commitAnimations请求的之间，可定义动画的展现方式。
    [UIView beginAnimations:@"Animation" context:nil];
    // 设置动画时长。
    [UIView setAnimationDuration:5.0f];
    // 设置动画播放速度类型为由慢至快再由快至慢。
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // 设置动画从他们当前状态开始播放。
    [UIView setAnimationBeginsFromCurrentState:YES];
    // 设置动画类型为从左向右翻转的动画。
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.imageView cache:YES];
    // 设置UIImageView对象的目录位置与尺寸。这样就建立了源状态到新状态的动画了。
    [self.imageView setFrame:CGRectMake(50, 50, 0, 0)];
    // 设置动画代理，监听动画结束事件。
    [UIView setAnimationDelegate:self];
    // 设定动画结束时执行的方法。
    [UIView setAnimationDidStopSelector:@selector(AnimationStop)];
    
    // commitAnimations标志着动画块的结束。
    [UIView commitAnimations];
}

#pragma mark - 创建动画结束时执行的方法。
- (void)AnimationStop
{
    // 输出一条日志。
    NSLog(@"Animation stop!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
