//
//  ViewController.m
//  更改UITableView单元格的顺序
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
    return UITableViewCellEditingStyleNone;
}

#pragma mark - 该代理方法用来设定是否允许拖动cell。
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - 该代理方法用来处理cell移动结束后的动作。
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 获得cell当前位置。
    NSInteger fromRow = [sourceIndexPath row];
    // 获得cell移动后的位置。
    NSInteger toRow = [destinationIndexPath row];
    
    // 及时两步数据源，保证数据与界面的一致性。
    id obj = [_array objectAtIndex:fromRow];
    [_array removeObjectAtIndex:fromRow];
    [_array insertObject:obj atIndex:toRow];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
