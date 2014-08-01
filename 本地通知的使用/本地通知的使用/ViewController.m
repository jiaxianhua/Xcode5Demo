//
//  ViewController.m
//  本地通知的使用
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
    
    // 创建一个UILocalNotification对象。
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    // 创建一个日期对象。
    NSDate *now = [NSDate date];
    // 设定在当前时间的2秒过后，触发本地通知。
    localNotification.fireDate = [now dateByAddingTimeInterval:5];
    
    // 设定重复次数。
    localNotification.repeatInterval = 0;
    // 设定时区为默认。
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    // 设定通知的提醒声音模板。
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    // 定义通知的文本内容。
    localNotification.alertBody = @"Hi, it's time to make a discision!";
    // 设定App图标右上角显示的数字。
    localNotification.applicationIconBadgeNumber = 5;
    
    // 创建一个NSDictionary对象，用来传递数据。
    NSDictionary *infoDic = [NSDictionary dictionaryWithObject:@"infoValue" forKey:@"infoKey"];
    localNotification.userInfo = infoDic;
    
    // 开始定时执行通知。
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
