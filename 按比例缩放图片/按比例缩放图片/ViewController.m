//
//  ViewController.m
//  按比例缩放图片
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

    UIImage *img = [UIImage imageNamed:@"pic"];
    // 调用scaleFromImage方法，将图片缩放为指定尺寸。
    img = [self scaleFromImage:img scaledToSize:CGSizeMake(100, 100)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    [imageView setCenter:CGPointMake(160, 160)];
    
    // 将UIImageView添加到当前窗口的根视图。
    [self.view addSubview:imageView];
}

#pragma mark - 通过Quartz上下文来实现缩放图片的功能。
#pragma mark 传递UIImage参数和一个缩放比较参数，实现将UIImage缩放至指定比较的功能。
- (UIImage *)scaleFromImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    // 获得UIImage对象的size属性。从而获得UIImage对象的宽度和高度。
    CGSize imageSize = image.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    // 计算UIImage对象新尺寸与旧尺寸的宽，高比例。
    CGFloat widthFactor = newSize.width / width;
    CGFloat heightFactor = newSize.height / height;
    // 获取最小的那个比例。
    CGFloat scaleFactor = ((widthFactor < heightFactor) ? widthFactor : heightFactor);
    
    // 计算UIImage对象新的宽度和高度。
    CGFloat scaleWidth = width * scaleFactor;
    CGFloat scaleHeight = height * scaleFactor;
    
    // 将新的宽度和高度构建成标准的CGSize对象。
    CGSize targetSize = CGSizeMake(scaleWidth, scaleHeight);
    
    // 创建Quartz上下文。
    UIGraphicsBeginImageContext(targetSize);
    // 将UIImage对象，画入（drawInRect）之前计算的新尺寸里，原点为（0，0）。
    [image drawInRect:CGRectMake(0, 0, scaleWidth, scaleHeight)];
    // 获取Quartz上下文里的内容，将内容写入到新的UIImage对象。
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭Quartz上下文。
    UIGraphicsEndImageContext();
    
    // 返回生成的新的UIImage对象。
    return newImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
