//
//  ViewController.m
//  Interview03-RunLoop
//
//  Created by MJ Lee on 2018/5/31.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
/*
讲讲 RunLoop，项目中有用到吗？
    控制线程生命周期（线程保活）
    解决NSTimer在滑动时停止工作的问题
    监控应用卡顿 https://www.2cto.com/kf/201707/653865.html
    性能优化

runloop内部实现逻辑？

runloop和线程的关系？ https://www.colabug.com/2855239.html
     1,每条线程都有唯一的一个与之对应的RunLoop对象
     2,RunLoop保存在一个全局的Dictionary里，线程作为key，RunLoop作为value
     3,线程刚创建时并没有RunLoop对象，RunLoop会在第一次获取它时创建
     4,RunLoop会在线程结束时销毁
     5,主线程的RunLoop已经自动获取（创建），子线程默认没有开启RunLoop

timer 与 runloop 的关系？https://www.aliyun.com/jiaocheng/359241.html
     iOS中默认开启的就是main函数里边的那个主线程runloop,iOS所有程序得以正产运行就是靠这个,
     所以当你开启nstimer的时候默认是可以运行的,因为默认会把nstimer添加到主线程
 
 
程序中添加每3秒响应一次的NSTimer，当拖动tableview时timer可能无法响应要怎么解决？//https://blog.csdn.net/qq_33777090/article/details/78631304
    在tableview滑动时timer就是显示暂停，原因是timer的这个简便构造方法把timer加入了NSRunLoopDefaultMode上，
    而tableview在滑动时只会处理UITrackingRunLoopMode，RunLoop并没有处理timer事件。
    解决的办法是将timer绑定到NSRunLoopCommonModes
 
 
runloop 是怎么响应用户操作的， 具体流程是什么样的？

说说runLoop的几种状态
 
runloop的mode作用是什么？
     model 主要是用来指定事件在运行循环中的优先级的，用来控制一些特殊操作只能在指定模式下运行,
     一般可以通过指定操作的运行mode 来控制执行时机
     目前已知的Mode有5种
     kCFRunLoopDefaultMode：App的默认Mode，通常主线程是在这个Mode下运行
     UITrackingRunLoopMode：界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
     UIInitializationRunLoopMode：在刚启动 App 时进入的第一个 Mode，启动完成后就不再使用
     GSEventReceiveRunLoopMode：接受系统事件的内部 Mode，通常用不到
     kCFRunLoopCommonModes：这是一个占位用的Mode，不是一种真正的
 
     苹果公开提供的 Mode 有两个：
     NSDefaultRunLoopMode（kCFRunLoopDefaultMode）
     NSRunLoopCommonModes（kCFRunLoopCommonModes）
 
*/
@implementation ViewController

NSMutableDictionary *runloops;

void observeRunLoopActicities(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info)
{
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"kCFRunLoopEntry");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"kCFRunLoopBeforeTimers");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"kCFRunLoopBeforeSources");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"kCFRunLoopBeforeWaiting");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"kCFRunLoopAfterWaiting");
            break;
        case kCFRunLoopExit:
            NSLog(@"kCFRunLoopExit");
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSRunLoop *runloop;
//    CFRunLoopRef runloop2;
    
//    runloops[thread] = runloop;
    
//    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//    CFRunLoopRef runloop2 = CFRunLoopGetCurrent();
    
//    NSArray *array;
//    CFArrayRef arry2;
//
//    NSString *string;
//    CFStringRef string2;
    
//    NSLog(@"%p %p", [NSRunLoop currentRunLoop], [NSRunLoop mainRunLoop]);
//    NSLog(@"%p %p", CFRunLoopGetCurrent(), CFRunLoopGetMain());
    
    // 有序的
//    NSMutableArray *array;
//    [array addObject:@"123"];
//    array[0];
    
    // 无序的
//    NSMutableSet *set;
//    [set addObject:@"123"];
//    [set anyObject];
//
//    kCFRunLoopDefaultMode;
//    NSDefaultRunLoopMode;
//    NSLog(@"%@", [NSRunLoop mainRunLoop]);
    
    
//    self.view.backgroundColor = [UIColor redColor];
    
    
    
    // kCFRunLoopCommonModes默认包括kCFRunLoopDefaultMode、UITrackingRunLoopMode
    
    
    // 创建Observer
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, observeRunLoopActicities, NULL);
//    // 添加Observer到RunLoop中
//    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
//    // 释放
//    CFRelease(observer);
    
    // 创建Observer
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopEntry - %@", mode);
                CFRelease(mode);
                break;
            }
                
            case kCFRunLoopExit: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopExit - %@", mode);
                CFRelease(mode);
                break;
            }
                
            default:
                break;
        }
    });
    // 添加Observer到RunLoop中
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    // 释放
    CFRelease(observer);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [NSTimer scheduledTimerWithTimeInterval:3.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"定时器-----------");
//    }];
    
}

@end
