//
//  NSObject+DeallocHandler.m
//  BestTimer
//
//  Created by 朱海波 on 02/08/2017.
//  Copyright © 2017 Tom.zhu. All rights reserved.
//

#import "NSObject+DeallocHandler.h"
#import "DeallocExecutor.h"
#import <objc/runtime.h>

const static char *DEALLOCKEY;

@implementation NSObject (DeallocHandler)
- (void)deallocHandler:(DeallocHandler)handler {
    DeallocExecutor *exe = [[DeallocExecutor alloc] initWithHandler:handler];
    objc_setAssociatedObject(self, DEALLOCKEY, exe, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
