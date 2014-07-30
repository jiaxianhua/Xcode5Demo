//
//  ViewController.h
//  使用UITableView制作简单表格
//
//  Created by GnuHua on 14-7-30.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>

// 首先添加两个Delegate。一个是UITableView代理，一个是UITableView数据源代理。
@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@end
