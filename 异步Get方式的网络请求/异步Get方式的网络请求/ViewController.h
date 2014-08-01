//
//  ViewController.h
//  异步Get方式的网络请求
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate>

// 接收网络数据。
@property (nonatomic) NSData *receiveData;

@end
