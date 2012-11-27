//
//  JTTeamColors.m
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import "JTTeamColors.h"

static NSColor *hexToColor(NSString *hex) {
    NSString *red = [hex substringWithRange:NSMakeRange(0, 2)];
    NSString *green = [hex substringWithRange:NSMakeRange(2, 2)];
    NSString *blue = [hex substringWithRange:NSMakeRange(4, 2)];
    unsigned int cred, cblue, cgreen;
    [[NSScanner scannerWithString:red] scanHexInt:&cred];
    [[NSScanner scannerWithString:blue] scanHexInt:&cblue];
    [[NSScanner scannerWithString:green] scanHexInt:&cgreen];
    return [NSColor colorWithDeviceRed:(CGFloat)cred / 255.0f
                                 green:(CGFloat)cgreen / 255.0f
                                  blue:(CGFloat)cblue / 255.0f
                                 alpha:1.0f];
}

@implementation JTTeamColors

+ (NSColor *)hexToColor:(NSString *)s
{
    return hexToColor(s);
}

+ (NSColor *)colorForTeam:(PHLTeam)t
{
    switch (t) {
        case Beez: return hexToColor(@"ffa500");
        case Duckies: return hexToColor(@"ffff54");
        case Sharks: return hexToColor(@"1b6453");
        case Rats: return hexToColor(@"99cc00");
        case Frogs: return hexToColor(@"008000");
        case Nights: return hexToColor(@"000052");
        case FFF: return hexToColor(@"9f00ff");
        case Pirates: return hexToColor(@"ffebcd");
        case m0nstars: return hexToColor(@"000000");
        case Roos: return hexToColor(@"ffff00");
        case Nobody: return hexToColor(@"333333");
    }
}

+ (NSColor *)foregroundColorForTeam:(PHLTeam)t
{
    switch (t) {
        case Beez: case Sharks: case Rats:
        case Frogs: case Nights: case FFF:
        case m0nstars: case Nobody: return [NSColor whiteColor];
        default: return [NSColor colorWithDeviceWhite:0.4f alpha:1.0f];
    }
}

+ (NSString *)nameForTeam:(PHLTeam)t
{
    switch (t) {
        case Beez: return @"Beez";
        case Duckies: return @"Duckies";
        case Sharks: return @"Sharks";
        case Rats: return @"Rats";
        case Frogs: return @"Frogs";
        case Nights: return @"Nights";
        case FFF: return @"Fires";
        case Pirates: return @"Pirates";
        case m0nstars: return @"m0nstars";
        case Roos: return @"Roos";
        case Nobody: return @"Nobody";
    }
}

@end
