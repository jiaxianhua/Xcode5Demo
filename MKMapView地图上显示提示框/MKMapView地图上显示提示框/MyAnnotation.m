//
//  MyAnnotation.m
//  MKMapView地图上显示提示框
//
//  Created by GnuHua on 14-7-30.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

#pragma mark - 实现头文件中定义的初始化方法。
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate2D
{
    if (self = [super init])
    {
        _coordinate = coordinate2D;
    }
    return self;
}

@end
