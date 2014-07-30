//
//  ViewController.m
//  MKMapView指定地理坐标
//
//  Created by GnuHua on 14-7-30.
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
    
    // 初始化MKMapView对象，并指定尺寸为屏幕尺寸。
    self.map = [[MKMapView alloc] initWithFrame:[self.view bounds]];
    // 显示当前用户的位置。
    self.map.showsUserLocation = YES;
    // 设置地图显示样式为卫星视图。
    self.map.mapType = MKMapTypeSatellite;
    
    // 通过设定经纬度，来获得一个地理位置。(朗山路口)
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(22.5566603923, 13.9468513915);
    // 配制地图显示区域的缩放级别。
    float zoomLevel = 0.02f;
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    // 设置MKMapView的显示区域。
    [self.map setRegion:[self.map regionThatFits:region] animated:YES];
    
    // 将MKMapView对象添加到当前窗口的根视图。
    [self.view addSubview:self.map];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
