//
//  LZDashLineView.h
//  LZDependencyControlkit
//
//  Created by Dear.Q on 2020/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 虚线位置
typedef NS_OPTIONS(NSUInteger, LZDashLinePosition) {
    /// 水平，默认
    LZDashLinePositionHorizontal = 1 << 0,
    /// 垂直
    LZDashLinePositionVertical = 1 << 1,
    /// 上
    LZDashLinePositionTop = 1 << 2,
    /// 左
    LZDashLinePositionLeft = 1 << 3,
    /// 下
    LZDashLinePositionBottom = 1 << 4,
    /// 右
    LZDashLinePositionRight = 1 << 5,
};

@interface LZDashLineView : UIView

/// 线条颜色，默认 [UIColor whiteColor]
@property (nonatomic, strong) UIColor *lineColor;
/// 线条位置，默认 LZDashLinePositionHorizontal
@property (nonatomic, assign) LZDashLinePosition linePsition;
/// 圆角半径，默认 6.0
@property (nonatomic, assign) CGFloat cornerRadius;

@end

NS_ASSUME_NONNULL_END
