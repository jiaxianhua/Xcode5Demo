//
//  ViewController.m
//  计算两个日期间的差值
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
    
    // 创建第一个日期对象，其值为当前时间。
    NSDate *dateA = [NSDate date];
    // 创建第二个日期对象，可以自定义时间。
    NSDate *dateB = [[NSDate alloc] initWithTimeInterval:-60*60*24*1000 sinceDate:[NSDate date]];
    
    // NSCalendar用于处理时间相关问题。比如比较时间前后，计算日期单差别等，它支持多种历法，这里采用阳历。
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    // 根据两个时间点，定义NSDateComponents对象，从而获取这两个时间点的时差。
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
                                               fromDate:dateA
                                                 toDate:dateB
                                                options:0];
    // 通过NSLog，在控制台输出结果。
    NSLog(@"Difference in date components: %i/%i/%i", components.day, components.month, components.year);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
