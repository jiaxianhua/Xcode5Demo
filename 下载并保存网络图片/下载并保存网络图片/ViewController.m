//
//  ViewController.m
//  下载并保存网络图片
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
    
    // 获取App项目的Documents文件夹。
    NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    // 获取网络图片。
    UIImage *imageFromURL = [self getImageFromURL:@"http://www.gnu.org/graphics/heckert_gnu.small.png"];
    
    // 将网络图片保存至App项目的Documents文件夹。
    [self saveImage:imageFromURL withFileName:@"image" ofType:@"png" inDirection:documentsDirectoryPath];
    
    NSLog(@"Path of saved image : %@", documentsDirectoryPath);
}

#pragma mark - 创建一个方法，用来获取网络图片，参数为图片的网络路径。
- (UIImage *)getImageFromURL:(NSString *)fileURL
{
    NSLog(@"Getting Image ...");
    UIImage *result;
    
    // 获取网络图片，并将二进制数据存入NSData对象中。
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    // 将NSData对象转换为UIImage对象。
    result = [UIImage imageWithData:data];
    
    return result;
}

#pragma mark - 创建一个方法，用来将UIImage对象保存到磁盘。
- (void)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirection:(NSString *)directionPath
{
    // 检测图片扩展名，如果是png后缀，则使用UIImagePNGRepresentation将图片转为NSData,并写入磁盘。
    if ([[extension lowercaseString] isEqualToString:@"png"])
    {
        [UIImagePNGRepresentation(image) writeToFile:[directionPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", image, @".png"]] options:NSAtomicWrite error:nil];
    }
    else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"])
    {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directionPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", image, @".jpg"]] options:NSAtomicWrite error:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
