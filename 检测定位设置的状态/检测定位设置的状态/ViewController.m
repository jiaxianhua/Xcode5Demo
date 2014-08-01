//
//  ViewController.m
//  检测定位设置的状态
//
//  Created by GnuHua on 14-8-1.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // 首先通过 Core Location 框架的locationServicesEnabled方法，判断设备（iPhone/iPad）是不是开启了地理位置的服务。
    BOOL locationServicesEnabled = [CLLocationManager locationServicesEnabled];
    // 再判断设备是否具备磁力感应，磁力感应可以控制地理位置的精确度。
    BOOL magnetometerAvailable = [CLLocationManager headingAvailable];
    
    NSLog(@"------- locationServicesEnabled:%d", locationServicesEnabled);
    NSLog(@"------- magnetometerAvailable:%d", magnetometerAvailable);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
