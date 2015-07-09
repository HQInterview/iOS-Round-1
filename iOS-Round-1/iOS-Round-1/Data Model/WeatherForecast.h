//
//  WeatherForcast.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@class WeatherCondition;
@interface WeatherForecast : NSObject

@property (nonatomic, readonly) NSDate *timeStamp;
@property (nonatomic, readonly) WeatherCondition *weatherCondition;

- (instancetype)initWithTime:(NSDate *)time andWeather:(WeatherCondition *)weatherCondition;

@end
