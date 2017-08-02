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
    TimerBridge *bridge = [[TimerBridge alloc] initWithReceiver:self];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:bridge selector:@selector(count) userInfo:nil repeats:YES];
    [_timer fire];
    [bridge setTimer:_timer];
}

- (void)count {
    [label setText:[NSString stringWithFormat:@"%i", [label.text intValue] + 1]];
}

@end
