//
//  NSObject+DeallocHandler.h
//  BestTimer
//
//  Created by 朱海波 on 02/08/2017.
//  Copyright © 2017 Tom.zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeallocDefine.h"

@interface NSObject (DeallocHandler)
- (void)deallocHandler:(DeallocHandler)handler;
@end
