//
//  Car.m
//  NSKeyedArchiver存储和解析数据
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)encodeWithCoder:(NSCoder *)aCoder;
{
    [aCoder encodeObject:_brand forKey:@"_brand"];
    [aCoder encodeObject:_color forKey:@"_color"];
}

#pragma mark - 实现NSCoding协议的decode方法。 encodeWithCoder就是编码，initWithCoder就是解码。
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super init])
    {
        _brand = [aDecoder decodeObjectForKey:@"_brand"];
        _color = [aDecoder decodeObjectForKey:@"_color"];
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    Car *car = [[[self class] allocWithZone:zone] init];
    car.brand = [self.brand copyWithZone:zone];
    car.color = [self.color copyWithZone:zone];
    
    return car; 
}

@end
