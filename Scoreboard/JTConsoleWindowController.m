//
//  JTConsoleWindowController.m
//  Scoreboard
//
//  Created by Joel on 11/27/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import "JTConsoleWindowController.h"

@interface JTConsoleWindowController ()

@end

@implementation JTConsoleWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib
{
    NSDictionary *stuff = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Teams" withExtension:@"plist"]];
    NSDictionary *titleAttributes = @{
        NSForegroundColorAttributeName: [NSColor colorWithDeviceWhite:0.5f
                                                                alpha:1.0f],
        NSFontAttributeName: [NSFont systemFontOfSize:12.0f]
    };
    
    [stuff enumerateKeysAndObjectsUsingBlock:^(NSString *teamCategory,
                                               NSDictionary *teams,
                                               BOOL *stop) {
        NSMenuItem *titleItem = [[NSMenuItem new] autorelease];
        [titleItem setAttributedTitle:[[[NSAttributedString alloc] initWithString:teamCategory
                                                                      attributes:titleAttributes] autorelease]];
        [titleItem setEnabled:NO];
        [[self.homeTeams menu] addItem:titleItem];
        [[self.awayTeams menu] addItem:[[titleItem copy] autorelease]];
        
        NSArray *sortedTeams = [[teams allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        
        for (NSString *teamName in sortedTeams) {
            NSDictionary *attrs = [teams objectForKey:teamName];
            NSMenuItem *teamItem = [[NSMenuItem new] autorelease];
            [teamItem setTitle:teamName];
            [teamItem setIndentationLevel:1];
            [teamItem setRepresentedObject:attrs];
            [teamItem setTarget:[[NSApplication sharedApplication] delegate]];
            [teamItem setAction:@selector(pickHomeTeam:)];
            [[self.homeTeams menu] addItem:teamItem];
            NSMenuItem *nextTeamItem = [[teamItem copy] autorelease];
            [nextTeamItem setAction:@selector(pickAwayTeam:)];
            [[self.awayTeams menu] addItem:nextTeamItem];
        }
    }];
}

@end
