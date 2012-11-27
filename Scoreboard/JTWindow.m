//
//  JTWindow.m
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import "JTWindow.h"

@implementation JTWindow

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect
                            styleMask:NSBorderlessWindowMask
                              backing:bufferingType
                                defer:NO];
    
    [self setHasShadow:NO];
    [self setAlphaValue:1.0];
    [self setBackgroundColor:[NSColor colorWithDeviceRed:0.235 green:0.192 blue:0.168 alpha:1.0]];
    [self setLevel:NSFloatingWindowLevel];
    
    return self;
}

- (BOOL)canBecomeKeyWindow
{
    return YES;
}

- (BOOL)isMovableByWindowBackground
{
    return YES;
}

@end
