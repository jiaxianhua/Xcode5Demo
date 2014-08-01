//
//  QuartzView.m
//  使用Quartz2D绘制基本图形
//
//  Created by GnuHua on 14-8-1.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - 重写父类的drawRect方法来重绘界面。
- (void)drawRect:(CGRect)rect
{
    // 获得当前View的图形上下文，即context。
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // CGContextSetRGBFillColor函数来创建和设置背景填充颜色为黄色。
    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 1.0);
    // 填充背景。
    CGContextFillRect(context, rect);
    // CGContextSetRGBStrokeColor函数来创建和设置边框颜色。
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
    // 设置画笔线条粗细。
    CGContextSetLineWidth(context, 2.0);
    // 设置矩形的位置及尺寸。
    CGRect rect2 = CGRectMake(100, 150, 100, 30);
    // 将矩形边框添加至上下文，做出绘制矩形的准备工作。
    CGContextAddRect(context, rect2);
    // 设置矩形边框。
    CGContextStrokePath(context);
    
    // 设置画笔线条粗细。
    CGContextSetLineWidth(context, 2.0);
    // 设置填充颜色。
    CGContextSetRGBFillColor(context, 1.0, 0.0, 1.0, 1.0);
    // 创建一个UIFont字体对象。
    UIFont *font = [UIFont boldSystemFontOfSize:31];
    NSString *text = @"Hello";
    // 设置文字的显示位置和尺寸。
    CGRect rect3 = CGRectMake(100, 120, 100, 30);
    // 将文字绘制在设定的区域内。
    [text drawInRect:rect3 withFont:font];
    
    // 设置画笔线条粗细。
    CGContextSetLineWidth(context, 5.0);
    // 设置线条样式。
    CGContextSetLineCap(context, kCGLineCapButt);
    // 设置边框颜色。
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    // 创建一个坐标数据。
    CGPoint points[5];
    points[0] = CGPointMake(100, 200);
    points[1] = CGPointMake(100, 300);
    points[2] = CGPointMake(200, 300);
    points[3] = CGPointMake(200, 200);
    points[4] = CGPointMake(100, 200);
    CGContextAddLines(context, points, 5);
    
    // 执行绘制边框操作。
    CGContextStrokePath(context);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
