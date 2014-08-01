//
//  IOSApp.m
//  PerformSelector消息处理方法
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "IOSApp.h"

@implementation IOSApp

// 实现无参的方法。
- (void)printInformation
{
    NSLog(@"Xcode Interaction Tutorials");
}

// 实现带有参数的方法。
- (void)buyApp:(id)AppName
{
    NSLog(@"Buy the App : %@", AppName);
}

@end
