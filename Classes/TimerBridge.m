//
//  TimerBridge.m
//  BestTimer
//
//  Created by 朱海波 on 02/08/2017.
//  Copyright © 2017 Tom.zhu. All rights reserved.
//

#import "TimerBridge.h"
#import "NSObject+DeallocHandler.h"

static NSTimer *_timer;

@implementation TimerBridge
{
    __weak id _receiver;
}
- (instancetype)initWithReceiver:(id)receiver {
    if (self = [super init]) {
        NSParameterAssert(receiver);
        _receiver = receiver;
        [_receiver deallocHandler:^{
            [_timer invalidate];
            _timer = nil;
        }];
    }
    return self;
}

- (void)setTimer:(NSTimer*)timer {
    _timer = timer;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _receiver;
}

@end
