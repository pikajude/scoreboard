//
//  JTAppDelegate.m
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import "JTAppDelegate.h"

@implementation JTAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)awakeFromNib
{
    self.half.info = @"half";
    self.half.num = 1;
    self.game.info = @"game";
    self.game.num = 1;
}

- (IBAction)homeTickUp:(id)sender
{
    [self.homeTeam tickUp];
}

- (IBAction)homeTickDown:(id)sender;
{
    [self.homeTeam tickDown];
}

- (IBAction)awayTickUp:(id)sender
{
    [self.awayTeam tickUp];
}

- (IBAction)awayTickDown:(id)sender
{
    [self.awayTeam tickDown];
}

- (IBAction)halfTickUp:(id)sender
{
    [self.half tickUp];
}

- (IBAction)halfTickDown:(id)sender
{
    [self.half tickDown];
}

- (IBAction)gameTickUp:(id)sender
{
    [self.game tickUp];
}

- (IBAction)gameTickDown:(id)sender
{
    [self.game tickDown];
}

- (IBAction)swap:(id)sender
{
    NSString *placeholder = self.awayTeam.team;
    self.awayTeam.team = self.homeTeam.team;
    self.homeTeam.team = placeholder;
    
    NSColor *placeholderC = self.awayTeam.color;
    self.awayTeam.color = self.homeTeam.color;
    self.homeTeam.color = placeholderC;
    
    self.awayTeam.score ^= self.homeTeam.score;
    self.homeTeam.score ^= self.awayTeam.score;
    self.awayTeam.score ^= self.homeTeam.score;
    
    [self.awayTeam setNeedsDisplay:YES];
    [self.homeTeam setNeedsDisplay:YES];
    
    NSInteger homeIndex = [self.homeTeams indexOfSelectedItem];
    [self.homeTeams selectItemAtIndex:[self.awayTeams indexOfSelectedItem]];
    [self.awayTeams selectItemAtIndex:homeIndex];
}

- (IBAction)resetAll:(id)sender
{
    [self.homeTeam reset];
    [self.awayTeam reset];
    [self halfTickDown:self];
    [self homeTickDown:self];
    [self awayTickDown:self];
}

- (void)pickHomeTeam:(NSMenuItem *)sender
{
    NSDictionary *attr = [sender representedObject];
    self.homeTeam.team = [attr objectForKey:@"display"];
    self.homeTeam.color = [JTTeamColors hexToColor:[attr objectForKey:@"color"]];
    self.homeTeam.bright = [[attr objectForKey:@"bright"] boolValue];
    [self.homeTeam setNeedsDisplay:YES];
}

- (void)pickAwayTeam:(NSMenuItem *)sender
{
    NSDictionary *attr = [sender representedObject];
    self.awayTeam.team = [attr objectForKey:@"display"];
    self.awayTeam.color = [JTTeamColors hexToColor:[attr objectForKey:@"color"]];
    self.awayTeam.bright = [[attr objectForKey:@"bright"] boolValue];
    [self.awayTeam setNeedsDisplay:YES];
}

@end
