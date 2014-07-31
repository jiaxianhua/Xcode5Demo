//
//  ViewController.m
//  转换图片为灰度图
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
    
    // 从项目资源文件中读取一张图片。
    UIImage *image = [UIImage imageNamed:@"pic"];
    // 将图片转换为灰度图。
    image = [self getGrayImageFrom:image];
    
    CGRect rect = CGRectMake(60, 80, 206, 284);
    // 创建一个UIImageView，由它负责显示灰度图。
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    [imageView setImage:image];
    
    // 将UIImageView添加到当前窗口的根视图。
    [self.view addSubview:imageView];
}

#pragma mark -
- (UIImage *)getGrayImageFrom:(UIImage *)image
{
    // 获得UIImage对象的宽度和高度。
    int imgWidth = image.size.width;
    int imgHeight = image.size.height;
    
    // 创建色彩空间对象。各种设备对待颜色的方式都不同，颜色必须有一个相关的色彩空间。否则，Quartz将不知道如何解释的颜色值。
    CGColorSpaceRef spaceRef = CGColorSpaceCreateDeviceGray();
    // 参数1：指向要渲染的绘制内存的地址
    // 参数2，3：宽，高度
    // 参数4：内存中像素的每个组件的位数。
    // 参数5：每一行在内存所占的比特数
    // 参数6：上下文使用的颜色空间
    // 参数7：是否包含alpha通道；
    CGContextRef context = CGBitmapContextCreate(nil, imgWidth, imgHeight, 8, 0, spaceRef, kCGBitmapByteOrderDefault);
    // 释放色彩空间对象
    CGColorSpaceRelease(spaceRef);
    
    if (context == NULL)
    {
        return nil;
    }
    
    // 构建和图片同样大小的CGRect空间。
    CGRect rect = CGRectMake(0, 0, imgWidth, imgHeight);
    // 在灰度上下文中画入图片。
    CGContextDrawImage(context, rect, image.CGImage);
    // 从上下文中获取并生成转为灰度的图片。
    UIImage *grayOne = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context) ];
    // 释放Quartz上下文。
    CGContextRelease(context);
    
    return grayOne;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
