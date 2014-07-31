//
//  ViewController.m
//  SQLite数据库的删改查操作
//
//  Created by GnuHua on 14-7-31.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [self openDb];
//    [self createTestList];
//    [self insertTable];
//    [self insertTable];
//    [self insertTable];
//    [self insertTable];
    
    [self queryTable];
    [self deleteTable];
    [self queryTable];
    [self updateTable];
    [self queryTable];
}

#pragma mark - 存放数据库文件。
- (NSString *)dataFilePath
{
    NSArray *myPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *myDocpath = [myPaths objectAtIndex:0];
    NSString *filename = [myDocpath stringByAppendingPathComponent:@"data.db"];
    
    NSLog(@"db filename = %@", filename);
    
    return filename;
}

// 添加一个方法用来打开数据库。
- (void)openDb
{
    NSString *path = [self dataFilePath];
    // 打开数据库，如果数据库不存在则创建数据库。
    if (sqlite3_open([path UTF8String], &_database) == SQLITE_OK)
    {
        NSLog(@"sqlite3_open OK");
    }
    else
    {
        NSLog(@"sqlite3_open NG");
    }
}

// 创建数据库表格。
- (void)createTestList
{
    // 创建一条sql语句，用来在数据库里，创建一个表格。
    const char *creatSql = "create table if not exists people(ID INTEGER PRIMARY KEY AUTOINCREMENT,peopleId INT, NAME TEXT, AGE INT)";
    // 第三个参数是这条语句执行之后的回调函数。第四个参数是传递给回调函数使用的参数。第5个参数是错误信息。
    if (sqlite3_exec(_database, creatSql, NULL, NULL, NULL) == SQLITE_OK)
    {
        NSLog(@"createTestList OK");
    }
    else
    {
        NSLog(@"createTestList NG");
    }
}

// 往表格里添加数据。
- (void)insertTable
{
    // 创建一条sql语句，用来在数据库表里添加一条记录。
    const char *insertSql = "insert into people (peopleId, name, age) values (1, 'Jiaxh', 27)";
    // sqlite3_exec用来执行非查询的sql语句。在viewDidLoad里执行各方法。
    sqlite3_exec(_database, insertSql, NULL, NULL, NULL);
}

// 查询数据。
- (void)queryTable
{
    // 首先打开数据库。
    [self openDb];
    // 创建一条sql语句，用来查询数据库记录。
    const char *selectSql = "select ID, peopleId, name from people";
    // sqlite操作二进制数据需要用一个辅助的数据类型sqlite3_stmt，这个数据类型记录了一个sql语句。
    sqlite3_stmt *statement;
    
    // sqlite3_prepare_v2函数用来完成sql语句的解析。第三个参数的含义是前面sql语句的长度，-1表示自动计算它的长度。
    if (sqlite3_prepare_v2(_database, selectSql, -1, &statement, nil) == SQLITE_OK)
    {
        // 当函数sqlite3_step的返回值为SQLITE_ROW时，表明数据记录集中还包含剩余数据，可以继续进行遍历操作。
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            // 接收数据为int类型的数据库记录。
            int _id = sqlite3_column_int(statement, 0);
            int peopleId = sqlite3_column_int(statement, 1);
            // 接收数据为NSString类型的数据库记录。
            NSString *name = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
            NSLog(@"Id = %i, peopleId = %i, Name = %@", _id, peopleId, name);
        }
    }
}

// 删除数据。
- (void)deleteTable
{
    [self openDb];
    // 创建一条sql语句，用来删除数据库记录。
    const char *deleteSql = "delete from people where ID = 7";
    
    sqlite3_exec(_database, deleteSql, NULL, NULL, NULL);
    // 操作结束后，关闭数据库。
    sqlite3_close(_database);
}

// 更新数据。
- (void)updateTable
{
    [self openDb];
    // 创建一条sql语句，用来更新数据库记录。
    const char *updateSql = "update people set name = 'zte' where Id = 6";
    
    sqlite3_exec(_database, updateSql, NULL, NULL, NULL);
    // 操作结束后，关闭数据库。
    sqlite3_close(_database);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
