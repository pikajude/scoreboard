//
//  JTAppDelegate.h
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JTInfoView.h"
#import "JTScoreView.h"
#import "JTTeamColors.h"

@interface JTAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet JTScoreView *homeTeam;
@property (assign) IBOutlet JTScoreView *awayTeam;
@property (assign) IBOutlet NSPopUpButton *homeTeams;
@property (assign) IBOutlet NSPopUpButton *awayTeams;
@property (assign) IBOutlet JTInfoView *half;
@property (assign) IBOutlet JTInfoView *game;
@property (assign) IBOutlet NSButton *useHorns;

- (IBAction)homeTickUp:(id)sender;
- (IBAction)homeTickDown:(id)sender;
- (IBAction)awayTickUp:(id)sender;
- (IBAction)awayTickDown:(id)sender;

- (IBAction)halfTickUp:(id)sender;
- (IBAction)gameTickUp:(id)sender;

- (void)swap;
- (void)resetAll;

- (void)pickHomeTeam:(NSMenuItem *)sender;
- (void)pickAwayTeam:(NSMenuItem *)sender;

- (IBAction)toggleHorns:(id)sender;
- (BOOL)willUseHorns;

@end
