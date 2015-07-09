//
//  CityWeatherViewModel.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Weather;
@class WeatherCondition;
@class City;
@interface CityWeatherViewModel : NSObject

@property (nonatomic, readonly) NSString *viewTitle;
@property (nonatomic, readonly) WeatherCondition *nowWeather;
@property (nonatomic, readonly) NSArray *forecastCellModels;
@property (nonatomic, readonly) NSURL *countryImageUrl;

- (instancetype)initWithCity:(City *)city andCountryImageUrl:(NSURL *)countryImageUrl;

@end