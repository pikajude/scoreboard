//
//  JTScoreView.m
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import "JTScoreView.h"

@implementation JTScoreView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self reset];
    }
    
    return self;
}

- (void)reset
{
    self.team = @"Nobody";
    self.color = [NSColor colorWithDeviceWhite:0.3f alpha:1.0f];
    self.score = 0;
    self.bright = NO;
}

- (void)drawRect:(NSRect)dirtyRect
{
    NSShadow *textShadow = [[NSShadow new] autorelease];
    [textShadow setShadowColor:[NSColor colorWithDeviceWhite:0.0 alpha:0.2f]];
    [textShadow setShadowBlurRadius:0.0f];
    [textShadow setShadowOffset:NSMakeSize(0, -2)];
    NSMutableDictionary *textAttr = [[@{
        NSFontAttributeName: [NSFont fontWithName:@"Helvetica Neue Bold" size:36.0f],
        NSForegroundColorAttributeName: self.bright
                                      ? [NSColor colorWithDeviceWhite:0.5f alpha:1.0f]
                                      : [NSColor whiteColor],
        NSShadowAttributeName: textShadow
    } mutableCopy] autorelease];
    [self.color set];
    NSRectFill(dirtyRect);
    [[self.team uppercaseString] drawAtPoint:NSMakePoint(dirtyRect.origin.x + 11, dirtyRect.origin.y + 7)
                                                         withAttributes:textAttr];
    [[NSColor colorWithDeviceWhite:0.0f alpha:0.3f] set];
    NSRectFillUsingOperation(NSMakeRect(dirtyRect.origin.x + 230, dirtyRect.origin.y, 56.0f, dirtyRect.size.height), NSCompositeSourceOver);
    [[NSColor colorWithDeviceWhite:1.0f alpha:0.3f] set];
    [[NSBezierPath bezierPathWithRect:dirtyRect] stroke];
    [textAttr setValue:[NSColor whiteColor] forKey:NSForegroundColorAttributeName];
    [[NSString stringWithFormat:@"%ld", self.score] drawAtPoint:NSMakePoint(dirtyRect.origin.x + 248, dirtyRect.origin.y + 7)
                                                 withAttributes:textAttr];
}

- (void)tickUp
{
    self.score++;
    [self setNeedsDisplay:YES];
}

- (void)tickDown
{
    self.score = 0;
    [self setNeedsDisplay:YES];
}

@end
