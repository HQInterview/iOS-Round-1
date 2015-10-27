//
//  WeatherModel.m
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

- (id)initWithForecastForTheDay:(NSDictionary *)forecastForTheDay
{
  
    {
        
        self = [super init];
        if (self)
        {
            _summary = [forecastForTheDay objectForKey:@"summary"];
            _iconUrl = [forecastForTheDay objectForKey:@"iconUrl"];
            _tempMaxCelcius = [NSString stringWithFormat:@"%@",[forecastForTheDay objectForKey:@"tempMaxCelcius"]];
            _tempCelcius = [NSString stringWithFormat:@"%@",[forecastForTheDay objectForKey:@"tempCelsius"]];
            _tempMinCelcius = [NSString stringWithFormat:@"%@",[forecastForTheDay objectForKey:@"tempMinCelcius"]];
        }
        return self;
        
    }
    
}

@end
