//
//  LZFloatButton.h
//  LZDependencyControlkit
//
//  Created by Dear.Q on 2020/2/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZFloatButton : UIButton

// 父视图
@property(nonatomic,weak) UIView *parentView;
// 安全边距
@property(nonatomic ,assign) UIEdgeInsets safeInsets;

@end

NS_ASSUME_NONNULL_END
