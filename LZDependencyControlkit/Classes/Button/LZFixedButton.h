//
//  LZFixedButton.h
//  LZDependencyControlkit
//
//  Created by Dear.Q on 2020/2/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 按钮文字的位置
typedef NS_ENUM(NSUInteger, LZFixedButtonTitlePosition) {
    LZFixedButtonTitlePositionTop, // 上
    LZFixedButtonTitlePositionLeft, // 左
    LZFixedButtonTitlePositionBottom, // 下
    LZFixedButtonTitlePositionRight, // 右
};

@interface LZFixedButton : UIButton

@property (nonatomic, assign) LZFixedButtonTitlePosition titlePosition;
@property (nonatomic, assign) CGFloat titleProportionInButton;


@end

NS_ASSUME_NONNULL_END
