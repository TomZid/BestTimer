//
//  ViewController.m
//  BestTimer
//
//  Created by 朱海波 on 02/08/2017.
//  Copyright © 2017 Tom.zhu. All rights reserved.
//

#import "ViewController.h"
#import "TimerBridge.h"

@implementation ViewController
{
    NSTimer *_timer;
    __weak IBOutlet UILabel *label;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    TimerBridge *bridge = [[TimerBridge alloc] initWithReceiver:self deallocHandler:^{
        [_timer invalidate];
        _timer = nil;
    }];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:bridge selector:@selector(count) userInfo:nil repeats:YES];
    [_timer fire];
}

- (void)count {
    static int num = 0;
    [label setText:[NSString stringWithFormat:@"现在是: %i", num++]];
}

@end
