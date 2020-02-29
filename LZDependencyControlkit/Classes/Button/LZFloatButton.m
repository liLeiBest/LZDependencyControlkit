//
//  LZFloatButton.m
//  LZDependencyControlkit
//
//  Created by Dear.Q on 2020/2/29.
//

#import "LZFloatButton.h"

@implementation LZFloatButton

// MARK: - Initialization
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self initialization];
    }
    return self;
}

- (void)dealloc {
    
    for (UIGestureRecognizer *gestureRecognizer in self.gestureRecognizers) {
        if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
            [self removeGestureRecognizer:gestureRecognizer];
            return;
        }
    }
}

// MARK: - UI Action
- (void)floatPanGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    
    [gestureRecognizer.view.superview bringSubviewToFront:gestureRecognizer.view];
    
    UIButton *sender = (UIButton *)gestureRecognizer.view;
    UIView *parentView = self.parentView ?: sender.superview;
    CGFloat senderCenterX = gestureRecognizer.view.center.x;
    CGFloat senderCenterY = gestureRecognizer.view.center.y;
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
        case UIGestureRecognizerStateChanged: {
            
            CGPoint translation = [gestureRecognizer translationInView:parentView];
            gestureRecognizer.view.center = CGPointMake(senderCenterX + translation.x, senderCenterY + translation.y);
        }
            break;
        case UIGestureRecognizerStateEnded: {
            
            CGFloat maxWidth = parentView.frame.size.width;
            CGFloat maxHeight = parentView.frame.size.height;
            CGFloat maxWidthHalf = maxWidth * 0.5f;
            CGFloat maxHeightHalf = maxHeight * 0.5f;
            CGFloat senderWidHalf = sender.frame.size.width * 0.5f;
            CGFloat senderHeightHalf = sender.frame.size.height * 0.5f;
            
            CGPoint stopPoint = CGPointMake(0, maxHeightHalf);
            if (senderCenterX < maxWidthHalf) { // 左半边
                if (senderCenterY <= maxHeightHalf) { // 左上
                    if (senderCenterX >= senderCenterY) { // 往上靠
                        stopPoint = CGPointMake(senderCenterX, senderHeightHalf);
                    } else { // 往左靠
                        stopPoint = CGPointMake(senderWidHalf, senderCenterY);
                    }
                } else { // 左下
                    if (senderCenterX >= maxHeight - senderCenterY) { // 往下靠
                        stopPoint = CGPointMake(senderCenterX, maxHeight - senderHeightHalf);
                    } else { // 往左靠
                        stopPoint = CGPointMake(senderWidHalf, senderCenterY);
                    }
                }
            } else { // 右半边
                if (senderCenterY <= maxHeightHalf) {
                    // 右上
                    if (maxWidth - senderCenterX >= senderCenterY) { // 往上靠
                        stopPoint = CGPointMake(senderCenterX, senderHeightHalf);
                    } else { // 往右靠
                        stopPoint = CGPointMake(maxWidth - senderWidHalf, senderCenterY);
                    }
                } else {
                    // 右下
                    if (maxWidth - senderCenterX >= maxHeight - senderCenterY) { // 往下靠
                        stopPoint = CGPointMake(senderCenterX, maxHeight - senderHeightHalf);
                    } else { // 往右靠
                        stopPoint = CGPointMake(maxWidth - senderWidHalf, senderCenterY);
                    }
                }
            }
            
            // 如果按钮超出屏幕边缘
            if (stopPoint.y - senderHeightHalf <= self.safeInsets.top) { // 上边
                stopPoint = CGPointMake(stopPoint.x, senderHeightHalf + self.safeInsets.top);
            }
            if (stopPoint.x - senderWidHalf <= self.safeInsets.left) { // 左边
                stopPoint = CGPointMake(senderWidHalf + self.safeInsets.left, stopPoint.y);
            }
            if (stopPoint.y + senderHeightHalf + self.safeInsets.bottom >= maxHeight) { // 下边
                stopPoint = CGPointMake(stopPoint.x, maxHeight - senderHeightHalf - self.safeInsets.bottom);
            }
            if (stopPoint.x + senderWidHalf + self.safeInsets.right >= maxWidth) { // 右边
                stopPoint = CGPointMake(maxWidth - senderWidHalf - self.safeInsets.right, stopPoint.y);
            }
            
            [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
                sender.center = stopPoint;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        default:
            break;
    }
    // 将手势坐标点归0、否则会累加
    [gestureRecognizer setTranslation:CGPointZero inView:sender.superview];
}

// MARK: - Private
- (void)initialization {
    
    self.safeInsets = UIEdgeInsetsZero;
    UIPanGestureRecognizer *panRecognizer =
    [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(floatPanGesture:)];
    [panRecognizer setDelaysTouchesBegan:YES];
    [panRecognizer cancelsTouchesInView];
    [self addGestureRecognizer:panRecognizer];
}

@end
