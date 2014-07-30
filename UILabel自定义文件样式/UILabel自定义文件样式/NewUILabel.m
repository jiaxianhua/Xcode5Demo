//
//  NewUILabel.m
//  UILabel自定义文件样式
//
//  Created by GnuHua on 14-7-30.
//  Copyright (c) 2014年 jiaxh. All rights reserved.
//

#import "NewUILabel.h"

@implementation NewUILabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// - 给UILabel文字添加描边效果。
// 重载父类的drawTextInRect方法，这样就可以从底层来自定义UILabel。
- (void)drawTextInRect:(CGRect)rect
{
    // 获取Quartz 2D上下文。
    CGContextRef c = UIGraphicsGetCurrentContext();
    // 设置上下文文字渲染为描边。
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    
    // 设置文字描边的边框宽度。
    CGContextSetLineWidth(c, 2);
    // 设置文字描边顶点连接方式。
    CGContextSetLineJoin(c, kCGLineJoinRound);
    // 设置文字颜色。
    self.textColor = [UIColor whiteColor];
    // 绘制文字的边框。
    [super drawTextInRect:rect];
    
    // 设置上下文文字渲染模式为填充。
    CGContextSetTextDrawingMode(c, kCGTextFill);
    // 设置文字颜色。
    UIColor *textColor = [UIColor blackColor];
    self.textColor = textColor;
    // 绘制文字的填充。
    [super drawTextInRect:rect];
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
