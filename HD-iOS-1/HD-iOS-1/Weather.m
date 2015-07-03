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
    self.timeString     = weather[@"timeString"];
    self.iconURL        = weather[@"iconUrl"];
    self.summary        = weather[@"summary"];
    self.tempCelsius    = [weather[@"tempCelsius"] floatValue];
    self.tempMaxCelcius = [weather[@"tempMaxCelcius"] floatValue];
    self.tempMinCelcius = [weather[@"tempMinCelcius"] floatValue];
    
    return self;
}

@end
