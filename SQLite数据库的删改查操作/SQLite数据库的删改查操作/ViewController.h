//
//  ViewController.h
//  SQLite数据库的删改查操作
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController

// 创建一个sqlite3类型的属性，作为数据库对象。
@property (assign, nonatomic) sqlite3 *database;

// 添加一个方法用来打开数据库。
- (void)openDb;
// 创建数据库表格。
- (void)createTestList;
// 往表格里添加数据。
- (void)insertTable;
// 查询数据。
- (void)queryTable;
// 删除数据。
- (void)deleteTable;
// 更新数据。
- (void)updateTable;

@end
