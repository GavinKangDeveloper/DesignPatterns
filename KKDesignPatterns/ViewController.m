//
//  ViewController.m
//  KKDesignPatterns
//
//  Created by ZhuKangKang on 2020/12/24.
//

#import "ViewController.h"
#import "KKSingletonMode.h"

#import "KKTestObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KKTestObject *test = [[KKTestObject alloc] init];
    test.age = 12;
    
    KKTestObject *test2 = [test mutableCopy];
    NSLog(@"+++++++%p++++++%zd\n++++++++%p++%zd",test,test.age,test2,test2.age);
}

#pragma mark - 单例模式
- (IBAction)onSingletonModeButtonAction:(id)sender {
    [NSThread detachNewThreadWithBlock:^{
        KKSingletonMode *manger = [KKSingletonMode sharedManager];
        for (int i=0; i < 1000; i++) {
            manger.age ++;
        }
        NSLog(@"-----age-+++%ld++++%@++++%p",(long)manger.age,[NSThread currentThread],manger);
    }];

    [NSThread detachNewThreadWithBlock:^{
        KKSingletonMode *manger = [KKSingletonMode sharedManager];
        for (int i=0; i < 1000; i++) {
            manger.age ++;
        }
        NSLog(@"-----age-22+++%ld++++%@++++%p",(long)manger.age,[NSThread currentThread],manger);
    }];
}


@end
