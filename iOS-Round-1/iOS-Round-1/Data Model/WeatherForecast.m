//
//  WeatherForcast.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "WeatherForecast.h"
#import "MTLJSONAdapter+Extension.h"

@interface WeatherForecast ()

@property (nonatomic, readwrite) NSDate *timeStamp;
@property (nonatomic, readwrite) WeatherCondition *weatherCondition;

@end

@implementation WeatherForecast

- (instancetype)initWithTime:(NSDate *)time andWeather:(WeatherCondition *)weatherCondition {
    self = [super init];
    if (self) {
        self.timeStamp = time;
        self.weatherCondition = weatherCondition;
    }
    return self;
}



@end
