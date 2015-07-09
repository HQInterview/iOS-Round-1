//
//  WeatherCondition.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "WeatherCondition.h"
#import "MTLJSONAdapter+Extension.h"

/**
 
 "summary": "Clouds",
 "humidity": 81,
 "longitude": 138.59999999999999,
 "iconUrl": "https://d3xm8g2fmv6ji.cloudfront.net/weather-icons/04d.png",
 "tempMaxCelcius": 11.76,
 "tempCelsius": 10.380000000000001,
 "tempMinCelcius": 8.7100000000000009,
 "latitude": -34.93,
 "timeString": "2015-06-22 02:00:00"
 
 */

@implementation WeatherCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"summary" : @"summary",
             @"humidity" : @"humidity",
             @"longitude" : @"longitude",
             @"iconUrl" : @"iconUrl",
             @"tempMaxCelcius" : @"tempMaxCelcius",
             @"tempCelsius" : @"tempCelsius",
             @"tempMinCelcius" : @"tempMinCelcius",
             @"latitude" : @"latitude",
             @"time" : @"timeString"};
}

+ (NSValueTransformer *)timeJSONTransformer {
    return [MTLJSONAdapter dateTimeJSONTransformer];
}

@end
