//
//  ViewController.m
//  UITableView单元格Accessory样式
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
    
    // 创建一个区域用来显示表格。
    CGRect rect = CGRectMake(0, 30, 300, 420);
    // 初始化UITableView。
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect];
    
    // 设置UITableView对象的代理。
    tableView.delegate = self;
    // 以及数据源的代理。
    tableView.dataSource = self;
    // 清除cell间的分隔线。
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // 将UITableView对象添加到当前窗口的根视图。
    [self.view addSubview:tableView];
}

#pragma mark - 该代理方法用来设定表格的行数。
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

#pragma mark - 该代理方法用来初始化和返回UITableView的Cell，是最重要的一个方法。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建一个字符串，作为Identifier,即cell标识符。
    static NSString *identifier = @"cellIdentifier";
    // Identifier可以看作是一种重用机制，此方法可以从所有已经开辟内存的cells里面，dequeue出一个以identifier为标识的空闲cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // 如果没有可以重复使用的cell，则创建新的cell.
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        NSInteger num = [indexPath row];
        cell.textLabel.text = [NSString stringWithFormat:@"Cell item #%i", num];
    }
    
    return cell;
}

#pragma mark - 该代理方法用来执行cell被选中时的动作。
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 根据indexPath获得被选中的cell对象。
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // 如果该cell没有被选中。
    if (cell.accessoryType == UITableViewCellAccessoryNone)
    {
        // 将cell设置为选中状态。
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    // 如果cell已被选中。
    else
    {
        // 再次点击时，将恢复为默认模式。
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
