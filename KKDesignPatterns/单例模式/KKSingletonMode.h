//
//  KKSingletonMode.h
//  KKDesignPatterns
//
//  Created by ZhuKangKang on 2020/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKSingletonMode : NSObject

/// 销毁单例
- (void)invalidate;
/// 初始化单例
+ (KKSingletonMode *)sharedManager;

@property (nonatomic, assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
