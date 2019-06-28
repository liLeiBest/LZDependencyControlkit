//
//  LZBadgeButton.h
//  Pods
//
//  Created by Dear.Q on 16/8/12.
//
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const LZBADGE_NONENUMBER;

@interface LZBadgeButton : UIButton

/** 提醒数字 */
@property (nonatomic, copy) NSString *badgeValue;

@end
