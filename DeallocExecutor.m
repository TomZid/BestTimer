//
//  DeallocExecutor.m
//  BestTimer
//
//  Created by 朱海波 on 02/08/2017.
//  Copyright © 2017 Tom.zhu. All rights reserved.
//

#import "DeallocExecutor.h"
@implementation DeallocExecutor
{
    DeallocHandler _handler;
}
- (instancetype)initWithHandler:(DeallocHandler)handler {
    if (self == [super init]) {
        _handler = handler;
    }
    return self;
}

- (void)dealloc {
    _handler ? _handler() : nil;
}

@end
