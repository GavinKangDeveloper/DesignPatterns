//
//  KKSingletonMode.m
//  KKDesignPatterns
//
//  Created by ZhuKangKang on 2020/12/24.
//

#import "KKSingletonMode.h"

static dispatch_once_t _onceToken;
static KKSingletonMode *_manager;

@interface  KKSingletonMode()<NSCopying, NSMutableCopying>

@end

@implementation KKSingletonMode

- (void)invalidate {
    _onceToken = 0;
    _manager = nil;
}

/**
 dispatch_once主要是根据onceToken的值来决定怎么去执行代码。

 当onceToken = 0时，线程执行dispatch_once的block中代码
 当onceToken = -1时，线程跳过dispatch_once的block中代码不执行
 当onceToken为其他值时，线程被线程被阻塞，等待onceToken值改变
 */
+ (KKSingletonMode *)sharedManager {
    NSLog(@"++11+++++%ld",_onceToken);

    dispatch_once(&_onceToken, ^{
        _manager = [[KKSingletonMode alloc] init];
    });
    NSLog(@"+++++++%ld",_onceToken);

    return _manager;

}

//+ (instancetype)allocWithZone:(struct _NSZone *)zone{
//    return [self sharedManager];;
//}

+ (instancetype)new {
    return  [self alloc];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return self;
}

@end
