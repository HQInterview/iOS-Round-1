//
//  CityWeatherTableViewCellModel.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/7/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherForecast;
@interface CityWeatherTableViewCellModel : NSObject

@property (nonatomic, readonly) NSString *dayOfWeekString;
@property (nonatomic, readonly) NSString *dayMonthString;
@property (nonatomic, readonly) NSString *summaryString;
@property (nonatomic, readonly) NSURL *weatherIconUrl;
@property (nonatomic, readonly) NSString *minimumTempString;
@property (nonatomic, readonly) NSString *maximumTempString;

- (instancetype)initWithWeatherForecast:(WeatherForecast *)weatherForecast sameMonth:(BOOL)isSameMonth;

@end
