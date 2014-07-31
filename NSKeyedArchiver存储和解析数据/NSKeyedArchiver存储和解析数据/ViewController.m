//
//  ViewController.m
//  NSKeyedArchiver存储和解析数据
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = CGRectMake(80, 100, 150, 30);
    UIButton *initData = [[UIButton alloc] initWithFrame:rect];
    [initData setBackgroundColor:[UIColor purpleColor]];
    [initData setTitle:@"Initialize data" forState:UIControlStateNormal];
    [initData addTarget:self action:@selector(initData) forControlEvents:UIControlEventTouchUpInside];
    
    // 点击按钮会解析已归档的对象。
    CGRect rect2 = CGRectMake(80, 200, 150, 30);
    UIButton *loadData = [[UIButton alloc] initWithFrame:rect2];
    [loadData setBackgroundColor:[UIColor purpleColor]];
    [loadData setTitle:@"Load data" forState:UIControlStateNormal];
    [loadData addTarget:self action:@selector(loadData) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:initData];
    [self.view addSubview:loadData];
}

#pragma mark - 设定归档对象的保存路径。
- (NSString *)fileDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"archiveFile"];
}

#pragma mark - 初始化对象，并将对象归档。
- (void)initData
{
    Car *car = [[Car alloc] init];
    car.brand = @"Apple";
    car.color = @"White";
    
    NSMutableData *data = [[NSMutableData alloc] init];
    
    // 初始化一个NSKeyedArchiver对象，用来处理Car对象的归档。
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    // 归档某个对象时，会为它提供一个名称，即键，从归档中检索该对象时，是根据这个键来检索的。
    [archiver encodeObject:car forKey:@"dataKey"];
    [archiver finishEncoding];
    
    // 归档后的数据保存到磁盘上。
    [data writeToFile:[self fileDirectory] atomically:YES];
    
    // 新建一个信息窗口，提示归档成功。
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Success to initialize data." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - 解析归档对象。
- (void)loadData
{
    NSString *filePath = [self fileDirectory];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSData *data = [[NSMutableData alloc] initWithContentsOfFile:filePath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        // 根据之前归档对象时，给对象设置的键来检索这个对象。
        Car *car = [unarchiver decodeObjectForKey:@"dataKey"];
        [unarchiver finishDecoding];
        
        NSString *info = [NSString stringWithFormat:@"Car Brand:%@\nCar Color:%@", car.brand, car.color];
        
        // 创建一个信息窗口，用来展示归档对象解析后的内容。
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:info delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
