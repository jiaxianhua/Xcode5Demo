//
//  ViewController.h
//  使用多线程下载网络图片
//
//  Created by GnuHua on 14-8-1.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>

// 用来接收有送URL连接状态的信息型回调。
@interface ViewController : UIViewController<NSURLConnectionDataDelegate>

// 标识加载状态。
@property (nonatomic) BOOL isLoaded;
// 接收网络数据。
@property (nonatomic) NSMutableData *bufferData;

@end
