//
//  KKTestObject.m
//  KKDesignPatterns
//
//  Created by ZhuKangKang on 2020/12/24.
//

#import "KKTestObject.h"

@interface KKTestObject ()<NSCopying,NSMutableCopying>

@end

@implementation KKTestObject

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    self.age = 18;
    return self;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    KKTestObject *test = [[KKTestObject alloc] init];
    test.age = 18;
    return test;
    
}

- (void)setAge:(NSInteger)age {
    @synchronized (self) {
        _age = age;
    }
}


@end
