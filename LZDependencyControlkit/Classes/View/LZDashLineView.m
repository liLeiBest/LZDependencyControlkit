//
//  LZDashLineView.m
//  LZDependencyControlkit
//
//  Created by Dear.Q on 2020/7/27.
//

#import "LZDashLineView.h"

@implementation LZDashLineView

// MARK: - Initialization
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupDefaultValue];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        
        [self setupDefaultValue];
    }
    return self;
}

// MARK: - Setter
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    
    [self.layer setNeedsDisplay];
}

- (void)setLinePsition:(LZDashLinePosition)linePsition {
    _linePsition = linePsition;
    
    [self.layer setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 绘制线的宽度
    CGFloat lineWidth = 1.4;
    CGContextSetLineWidth(context, lineWidth);
    // 线的颜色
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    // 开始绘制
    CGContextBeginPath(context);
    // lengths的值｛5, 5｝表示先绘制5个点，再跳过5个点，如此反复
    CGFloat lengths[] = {5, 5};
    CGContextSetLineDash(context, 0, lengths, 1);
    // 虚线的起始点
    if (self.linePsition & LZDashLinePositionTop
        && self.linePsition & LZDashLinePositionLeft
        && self.linePsition & LZDashLinePositionBottom
        && self.linePsition & LZDashLinePositionRight) {
        // 画矩形 path 圆角5度
        CGRect rect1 = CGRectMake(lineWidth * 0.5, lineWidth * 0.5, rect.size.width - lineWidth , rect.size.height - lineWidth);
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect1 cornerRadius:self.cornerRadius];
        CGContextAddPath(context, bezierPath.CGPath);
    } else {
        if (self.linePsition & LZDashLinePositionTop) {
            CGContextMoveToPoint(context, 0, lineWidth);
            CGContextAddLineToPoint(context, rect.size.width, lineWidth);
        }
        if (self.linePsition & LZDashLinePositionLeft) {
            CGContextMoveToPoint(context, lineWidth, 0);
            CGContextAddLineToPoint(context, lineWidth, rect.size.height);
        }
        if (self.linePsition & LZDashLinePositionBottom) {
            CGContextMoveToPoint(context, 0, rect.size.height - lineWidth);
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height - lineWidth);
        }
        if (self.linePsition & LZDashLinePositionRight) {
            CGContextMoveToPoint(context, rect.size.width - lineWidth, 0);
            CGContextAddLineToPoint(context, rect.size.width - lineWidth, rect.size.height);
        }
    }
    if (self.linePsition & LZDashLinePositionHorizontal) {
        CGContextMoveToPoint(context, 0, rect.size.height * 0.5);
        CGContextAddLineToPoint(context, rect.size.width, rect.size.height * 0.5);
    }
    if (self.linePsition & LZDashLinePositionVertical) {
        CGContextMoveToPoint(context, rect.size.width * 0.5, 0);
        CGContextAddLineToPoint(context, rect.size.width * 0.5, rect.size.height);
    }
    // 绘制
    CGContextStrokePath(context);
    // 关闭图像
    CGContextClosePath(context);
}

// MARK: - Private
- (void)setupDefaultValue {
    
    self.cornerRadius = 6.0;
    self.lineColor = [UIColor whiteColor];
    self.linePsition = LZDashLinePositionHorizontal;
}

@end
