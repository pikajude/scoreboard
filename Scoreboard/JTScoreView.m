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
    // text styles
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
    
    NSMutableParagraphStyle *st = [[[NSParagraphStyle defaultParagraphStyle] mutableCopy] autorelease];
    [st setAlignment:NSCenterTextAlignment];
    
    // draw the main scoreboard rectangle
    [self.color set];
    NSRectFill(dirtyRect);
    
    // draw the team name
    [[self.team uppercaseString] drawAtPoint:NSMakePoint(dirtyRect.origin.x + 11, dirtyRect.origin.y + 7)
                                                         withAttributes:textAttr];
    
    // draw the dark score square
    [[NSColor colorWithDeviceWhite:0.0f alpha:0.3f] set];
    NSRectFillUsingOperation(NSMakeRect(dirtyRect.origin.x + 230, dirtyRect.origin.y, 56.0f, dirtyRect.size.height), NSCompositeSourceOver);
    
    // stroke the scoreboard with white
    [[NSColor colorWithDeviceWhite:1.0f alpha:0.2f] set];
    NSBezierPath *border = [NSBezierPath bezierPathWithRect:NSMakeRect(dirtyRect.origin.x + 0.5f, dirtyRect.origin.y + 0.5f, 229, dirtyRect.size.height - 1.0f)];
    [border setLineWidth:1.0f];
    [border stroke];
    
    [[NSColor colorWithDeviceWhite:1.0f alpha:0.15f] set];
    NSBezierPath *border2 = [NSBezierPath bezierPathWithRect:NSMakeRect(dirtyRect.origin.x + 230.5f, dirtyRect.origin.y + 0.5f, dirtyRect.size.width - 231.0f, dirtyRect.size.height - 1.0f)];
    [border2 setLineWidth:1.0f];
    [border2 stroke];
    
    [[NSColor colorWithDeviceWhite:0.0f alpha:0.25f] set];
    [[NSBezierPath bezierPathWithRect:NSMakeRect(dirtyRect.origin.x + 230.5f, dirtyRect.origin.y, 0.0f, dirtyRect.size.height)] stroke];
    
    // draw score
    [textAttr setValue:[NSColor whiteColor] forKey:NSForegroundColorAttributeName];
    [textAttr setValue:st forKey:NSParagraphStyleAttributeName];
    /* [[NSString stringWithFormat:@"%ld", self.score] drawAtPoint:NSMakePoint(dirtyRect.origin.x + 248, dirtyRect.origin.y + 7)
                                                 withAttributes:textAttr]; */
    [[NSString stringWithFormat:@"%ld", self.score] drawInRect:NSMakeRect(dirtyRect.origin.x + 230, dirtyRect.origin.y - 4.5, dirtyRect.size.width - 230, dirtyRect.size.height)
                                                withAttributes:textAttr];
    
    // draw the shadow
    NSGradient *shadow = [[NSGradient alloc] initWithColorsAndLocations:[NSColor colorWithDeviceWhite:0.0f alpha:0.1f], 0.0f, [NSColor clearColor], 1.0f, nil];
    [shadow drawInRect:NSMakeRect(dirtyRect.origin.x + 230.0f, dirtyRect.origin.y, 12.0f, dirtyRect.size.height) angle:0.0f];
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
