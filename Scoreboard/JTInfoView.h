//
//  JTInfoView.h
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JTInfoView : NSView

@property (copy) NSString *info;
@property (assign) NSInteger num;
@property (assign) IBOutlet NSTextField *label;

- (void)tickUp;
- (void)tickDown;

@end
