//
//  JTInfoView.m
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import "JTInfoView.h"

static NSAttributedString *sbdisplay(NSString *str, NSInteger half) {
    NSMutableParagraphStyle *st = [[[NSParagraphStyle defaultParagraphStyle] mutableCopy] autorelease];
    [st setAlignment:NSCenterTextAlignment];
    NSMutableDictionary *halfAttr = [[@{NSFontAttributeName:
                                      [NSFont fontWithName:@"Helvetica Neue Bold"
                                                      size:36.0f],
                                      
                                      NSForegroundColorAttributeName:
                                      [NSColor colorWithDeviceRed:0.482f
                                                            green:0.482f
                                                             blue:0.482f
                                                            alpha:1.0f],
                                      
                                      NSParagraphStyleAttributeName: st
                                      } mutableCopy] autorelease];
    NSMutableAttributedString *h = [[[NSMutableAttributedString alloc]
                                    initWithString:[NSString stringWithFormat:@"%@ ", str]
                                    attributes:halfAttr] autorelease];
    [halfAttr setValue:[NSColor colorWithDeviceRed:0.741f
                                             green:0.741f
                                              blue:0.741f
                                             alpha:1.0f]
                forKey:NSForegroundColorAttributeName];
    [h appendAttributedString:[[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", half] attributes:halfAttr] autorelease]];
    return h;
}

@implementation JTInfoView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [self.label setAttributedStringValue:sbdisplay(self.info, self.num)];
    [[NSColor colorWithDeviceWhite:0.15f alpha:1.0f] set];
    NSRectFill(dirtyRect);
}

- (void)tickUp
{
    if(self.num < 5) {
        self.num++;
        [self setNeedsDisplay:YES];
    }
}

- (void)tickDown
{
    self.num = 1;
    [self setNeedsDisplay:YES];
}

@end
