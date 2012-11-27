//
//  JTTeamColors.h
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Beez,
    Duckies,
    Sharks,
    Rats,
    Frogs,
    Nights,
    FFF,
    Pirates,
    m0nstars,
    Roos,
    Nobody = -1
} PHLTeam;

@interface JTTeamColors : NSObject

+ (NSColor *)hexToColor:(NSString *)s;
+ (NSColor *)colorForTeam:(PHLTeam)t;
+ (NSColor *)foregroundColorForTeam:(PHLTeam)t;
+ (NSString *)nameForTeam:(PHLTeam)t;

@end
