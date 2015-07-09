//
//  Weather.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@class WeatherCondition;
@interface Weather : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) WeatherCondition *currentWeather;
@property (nonatomic, readonly) NSArray *forecastWeathers;

@end
