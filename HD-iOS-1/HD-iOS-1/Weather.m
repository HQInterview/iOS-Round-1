//
//  Weather.m
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/2/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "Weather.h"

@implementation Weather

-(id) initWithParameter:(NSDictionary *) weather
{
    self.timeString           = weather[@"timeString"];
    self.iconURL              = weather[@"iconUrl"];
    self.summary              = weather[@"summary"];
    
    NSUInteger firstCurlyBracePos = [self.timeString  rangeOfString:@"-" options:0].location;
    NSUInteger lastCurlyBracePos = [self.timeString  rangeOfString:@" " options: NSBackwardsSearch].location;
    
    if(firstCurlyBracePos != NSNotFound && lastCurlyBracePos != NSNotFound) {
        self.timeString   = [weather[@"timeString"] substringWithRange:NSMakeRange(firstCurlyBracePos + 1, lastCurlyBracePos - firstCurlyBracePos - 1)];
    }

    self.tempCelsiusString    = [NSString stringWithFormat:@"%ld °C", (long)[weather[@"tempCelsius"] integerValue]];
    self.tempMaxCelciusString = [NSString stringWithFormat:@"%ld", (long)[weather[@"tempMaxCelcius"] integerValue]];
    self.tempMinCelciusString = [NSString stringWithFormat:@"%ld", (long)[weather[@"tempMinCelcius"] integerValue]];
    return self;
}

@end
