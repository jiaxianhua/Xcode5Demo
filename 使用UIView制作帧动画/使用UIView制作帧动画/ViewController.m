//
//  ViewController.m
//  使用UIView制作帧动画
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
    
    // 初始化一个数组，用来加载图片。
    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    NSLog(@"%@", [NSString stringWithFormat:@"1%04d.gif", 13]);
    // 通过一个循环，将所有图片添加进数组里。
    for (int i = 1; i <= 40; ++i)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"1%04d.tif", i]];
        [myArray addObject:image];
    }
    
    UIImageView *myAnimatedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 320, 250)];
    // 将数组指定给UIImageView对象的动画图片数组里。
    myAnimatedView.animationImages = myArray;
    // 设定播放间隔，即每0.05秒切换至下一图片。
    myAnimatedView.animationDuration = 0.05f * 40;
    // 设置播放循环次数，0为无限循环播放。
    myAnimatedView.animationRepeatCount = 0;
    [myAnimatedView startAnimating];
    
    [self.view addSubview:myAnimatedView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
