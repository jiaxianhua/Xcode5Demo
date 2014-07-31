//
//  Car.h
//  NSKeyedArchiver存储和解析数据
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSCoding协议用来支持数据类和数据流间的编码和解码。通过继承NSCopying协议，使数据对象支持Copy.
@interface Car : NSObject<NSCoding, NSCopying>

@property (nonatomic, retain) NSString *brand;
@property (nonatomic, retain) NSString *color;

@end
