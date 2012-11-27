//
//  JTTeamColors.m
//  Scoreboard
//
//  Created by Joel on 11/15/12.
//  Copyright (c) 2012 Joel. All rights reserved.
//

#import "JTTeamColors.h"

@implementation JTTeamColors

+ (NSColor *)hexToColor:(NSString *)hex
{
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

@end
