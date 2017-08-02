//
//  TimerBridge.m
//  BestTimer
//
//  Created by 朱海波 on 02/08/2017.
//  Copyright © 2017 Tom.zhu. All rights reserved.
//

#import "TimerBridge.h"
#import "NSObject+DeallocHandler.h"

@implementation TimerBridge
{
    __weak id _receiver;
    DeallocHandler _handler;
}
- (instancetype)initWithReceiver:(id)receiver deallocHandler:(DeallocHandler)handler {
    if (self = [super init]) {
        NSParameterAssert(receiver);
        NSParameterAssert(handler);
        _receiver = receiver;
        _handler = handler;
        [_receiver deallocHandler:^{
            if (_handler) {
                _handler();
            }
        }];
    }
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _receiver;
}

@end
