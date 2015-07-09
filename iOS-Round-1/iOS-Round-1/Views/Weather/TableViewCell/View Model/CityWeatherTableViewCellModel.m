//
//  CityWeatherTableViewCellModel.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/7/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityWeatherTableViewCellModel.h"
#import "WeatherForecast.h"
#import "WeatherCondition.h"
#import "AppDelegate.h"

@interface CityWeatherTableViewCellModel ()

@property (nonatomic, readwrite) NSString *dayOfWeekString;
@property (nonatomic, readwrite) NSString *dayMonthString;
@property (nonatomic, readwrite) NSString *summaryString;
@property (nonatomic, readwrite) NSURL *weatherIconUrl;
@property (nonatomic, readwrite) NSString *minimumTempString;
@property (nonatomic, readwrite) NSString *maximumTempString;

@end

@implementation CityWeatherTableViewCellModel

- (instancetype)initWithWeatherForecast:(WeatherForecast *)weatherForecast sameMonth:(BOOL)isSameMonth {
    self = [super init];
    if (self) {
        NSDateFormatter *dateFormatter = ((AppDelegate *)[UIApplication sharedApplication].delegate).dateFormatter;
        dateFormatter.dateFormat = @"EEE";
        self.dayOfWeekString = [dateFormatter stringFromDate:weatherForecast.timeStamp];
        
        dateFormatter.dateFormat = (isSameMonth)? @"dd" : @"dd/MM";
        self.dayMonthString = [dateFormatter stringFromDate:weatherForecast.timeStamp];
        
        self.summaryString = weatherForecast.weatherCondition.summary;
        self.weatherIconUrl = [NSURL URLWithString:weatherForecast.weatherCondition.iconUrl];
        self.maximumTempString = [NSString stringWithFormat:@"%0.0f", weatherForecast.weatherCondition.tempMaxCelcius];
        self.minimumTempString = [NSString stringWithFormat:@"%0.0f", weatherForecast.weatherCondition.tempMinCelcius];
    }
    return self;
}


@end
