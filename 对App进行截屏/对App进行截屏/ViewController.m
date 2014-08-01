//
//  ViewController.m
//  对App进行截屏
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

    // 截屏，并将截屏图片存入相册的功能。
    
    // 创建一个UIColor对象，使用一张背影图片作为对象内容。
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg"]];
    // 设置当前窗口根视图背景。
    self.view.backgroundColor = background;

    // 在Quartz 2D 的上下文中，渲染当前窗口根视图的CALayer。
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 将Quartz 2D 上下文中的内容，转换成UIImage对象。
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文。
    UIGraphicsEndImageContext();
    
    // 将UIImage对象存入相册。
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
