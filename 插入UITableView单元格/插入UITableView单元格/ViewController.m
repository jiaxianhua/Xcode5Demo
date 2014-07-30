//
//  ViewController.m
//  插入UITableView单元格
//
//  Created by GnuHua on 14-7-30.
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
    
    // 初始化数组，作为UITableView的数据源。
    _array = [NSMutableArray arrayWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
    
    // 创建一个区域用来显示表格。
    CGRect rect = CGRectMake(0, 30, 300, 420);
    // 初始化UITableView。
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect];
    
    // 设置UITableView对象的代理。
    tableView.delegate = self;
    // 以及数据源的代理。
    tableView.dataSource = self;
    // 开启UITableView的编辑模式。
    [tableView setEditing:YES];
    
    // 将UITableView对象添加到当前窗口的根视图。
    [self.view addSubview:tableView];
}

#pragma mark - 该代理方法用来设定表格的行数。
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 设定表格拥有多少行数据。
    return [_array count];
}

#pragma mark - 该代理方法用来初始化和返回UITableView的Cell，是最重要的一个方法。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    // 创建一个字符串，作为Identifier,即cell标识符。
    static NSString *identifier = @"cellIdentifier";
    // Identifier可以看作是一种重用机制，此方法可以从所有已经开辟内存的cells里面，dequeue出一个以identifier为标识的空闲cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // 如果没有可以重复使用的cell，则创建新的cell.
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        NSInteger num = [indexPath row];
        // 设置cell的标题文字内容。
        cell.textLabel.text = [_array objectAtIndex:num];
        // 设置cell的描述文字内容。
        cell.detailTextLabel.text = @"Detail Information here.";
    }
    
    return cell;
}

#pragma mark - 该代理方法用来设定cell的编辑方式。
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 设定cell的编辑方式为插入模式。
    return UITableViewCellEditingStyleInsert;
}

#pragma mark - 该代理方法用来处理cell编辑结束后的动作。
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 判断是否是插入操作。
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        // 获取当前编辑的cell的行编号。
        NSInteger num = [indexPath row];
        // 往数组中同步插入新数据，及时更新数据源。
        [_array insertObject:@"Nice Day" atIndex:num];
        // 再往UITableView中插入新cell。
        NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
