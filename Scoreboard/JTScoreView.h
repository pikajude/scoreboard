//
//  JTScoreView.h
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JTTeamColors.h"

@interface JTScoreView : NSView

@property (assign) NSString *team;
@property (retain) NSColor *color;
@property (assign) NSInteger score;
@property (assign) BOOL bright;

- (void)tickUp;
- (void)tickDown;
- (void)reset;

@end
