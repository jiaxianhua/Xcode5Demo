//
//  ViewController.m
//  SQLite数据库和表的创建
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
    
    [self openDb];
    [self createTestList];
    [self insertTable];
}

#pragma mark - 存放数据库文件。
- (NSString *)dataFilePath
{
    NSArray *myPaths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *myDocpath = [myPaths objectAtIndex:0];
    NSString *filename = [myDocpath stringByAppendingString:@"data.db"];
    
    NSLog(@"db filename = %@", filename);
    
    return filename;
}

// 添加一个方法用来打开数据库。
- (void)openDb
{
    NSString *path = [self dataFilePath];
    // 打开数据库，如果数据库不存在则创建数据库。
    sqlite3_open([path UTF8String], &_database);
    
}

// 创建数据库表格。
- (void)createTestList
{
    // 创建一条sql语句，用来在数据库里，创建一个表格。
    const char *creatSql = "create table if no exists people(ID INTEGER PRIMARY KEY AUTOINCREMENT, PEOPLEDID INT, NAME TEXT, AGE INT)";
    // 第三个参数是这条语句执行之后的回调函数。第四个参数是传递给回调函数使用的参数。第5个参数是错误信息。
    sqlite3_exec(_database, creatSql, NULL, NULL, NULL);
}

// 往表格里添加数据。
- (void)insertTable
{
    // 创建一条sql语句，用来在数据库表里添加一条记录。
    const char *insertSql = "insert into people(peopleId, name, age) values (1, 'Jiaxh', 27)";
    // sqlite3_exec用来执行非查询的sql语句。在viewDidLoad里执行各方法。
    sqlite3_exec(_database, insertSql, NULL, NULL, NULL);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
