//
//  IOSApp.h
//  PerformSelector消息处理方法
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOSApp : NSObject

// 添加一个无参的方法。
- (void)printInformation;
// 添加一个带有参数的方法。
- (void)buyApp:(id)AppName;

@end
