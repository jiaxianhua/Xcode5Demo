//
//  ViewController.h
//  MKMapView加载简单地图
//
//  Created by GnuHua on 14-7-30.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>

// 导入MapKit头文件
#import <MapKit/MapKit.h>
// 导入CoreLocation头文件，使用CoreLocation框架可以确定设备的地理位置。
#import <CoreLocation/CoreLocation.h>

// 添加两个协议，用来处理地图加载和地理位置变更事件。
@interface ViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

// 添加一个属性用来加载地图。
@property (nonatomic) MKMapView *map;

@end
