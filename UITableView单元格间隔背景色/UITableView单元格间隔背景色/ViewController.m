//
//  ViewController.m
//  UITableView单元格间隔背景色
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
        
        // 设置偶数行（从0开始）背景色为紫色。
        if (num % 2 == 0)
        {
            [cell setBackgroundColor:[UIColor purpleColor]];
        }
        // 设置奇数行背景色为褐(橙)色。
        else
        {
            [cell setBackgroundColor:[UIColor orangeColor]];
        }
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
