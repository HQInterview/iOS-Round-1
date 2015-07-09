//
//  CityWeatherViewModel.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityWeatherViewModel.h"
#import "Weather.h"
#import "WeatherForecast.h"
#import "WeatherCondition.h"
#import "AppDelegate.h"

#import "City.h"
#import "CityWeatherTableViewCellModel.h"

@interface CityWeatherViewModel ()

@property (nonatomic, readwrite) NSString *viewTitle;
@property (nonatomic, readwrite) WeatherCondition *nowWeather;
@property (nonatomic, readwrite) NSArray *forecastCellModels;
@property (nonatomic, strong) NSArray *weatherForecasts;
@property (nonatomic, readwrite) NSURL *countryImageUrl;

@end

@implementation CityWeatherViewModel

- (instancetype)initWithCity:(City *)city andCountryImageUrl:(NSURL *)countryImageUrl {
    self = [super init];
    if (self) {
        self.viewTitle = city.cityName;
        self.nowWeather = city.weather.currentWeather;
        self.weatherForecasts = city.weather.forecastWeathers;
        self.countryImageUrl = countryImageUrl;
        [self initialize];
    }
    return self;
}

- (void)initialize {
    NSMutableArray *cellModels = [NSMutableArray array];
    for (int i = 0; i < self.weatherForecasts.count || cellModels.count >= 5; i++) {
        if (self.weatherForecasts.count > i) {
            WeatherForecast *forecast = self.weatherForecasts[i];
            if ([forecast.weatherCondition.time compare:self.nowWeather.time] == NSOrderedSame) {
                continue;
            }
            
            // From data, this is not possible but just have it is feel good.
            NSDateFormatter *formatter = ((AppDelegate *)[UIApplication sharedApplication].delegate).dateFormatter;
            formatter.dateFormat = @"MM/yyyy";
            NSString *thisMonth = [formatter stringFromDate:self.nowWeather.time];
            NSString *forecastMonth = [formatter stringFromDate:forecast.timeStamp];
            
            [cellModels addObject:[[CityWeatherTableViewCellModel alloc] initWithWeatherForecast:forecast sameMonth:([thisMonth isEqualToString:forecastMonth])]];
        } else {
            break;
        }
    }
    self.forecastCellModels = cellModels;
}


@end
