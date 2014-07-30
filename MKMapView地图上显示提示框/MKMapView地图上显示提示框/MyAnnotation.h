//
//  MyAnnotation.h
//  MKMapView地图上显示提示框
//
//  Created by GnuHua on 14-7-30.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <Foundation/Foundation.h>

// 导入MapKit头文件。
#import <MapKit/MapKit.h>

// 添加一个MKAnnotaion协议。
@interface MyAnnotation : NSObject<MKAnnotation>

// 添加一个地址位置坐标的属性。
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
// 设定提示窗口的标题。
@property (nonatomic, copy) NSString *title;
// 设定提示窗口的子标题。
@property (nonatomic, copy) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate2D;

@end
