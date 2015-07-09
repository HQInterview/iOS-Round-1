//
//  CityWeatherNowViewModel.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityWeatherNowViewModel.h"
#import "WeatherCondition.h"
#import "AppDelegate.h"

@interface CityWeatherNowViewModel ()

@property (nonatomic, readwrite) NSString *viewTitle;
@property (nonatomic, readwrite) NSString *weatherUrl;
@property (nonatomic, readwrite) NSString *weatherTitle;
@property (nonatomic, readwrite) NSString *weatherMin;
@property (nonatomic, readwrite) NSString *weatherMax;
@property (nonatomic, readwrite) NSString *weatherCurrent;
@property (nonatomic, readwrite) NSString *todayDateString;

@end

@implementation CityWeatherNowViewModel

- (instancetype)initWithTitle:(NSString *)title weatherCondition:(WeatherCondition *)weatherCondition {
    self = [super init];
    if (self) {
        self.viewTitle = title;
        self.weatherUrl = weatherCondition.iconUrl;
        self.weatherTitle = weatherCondition.summary;
        self.weatherMin = [NSString stringWithFormat:@"%0.0f\u00B0", weatherCondition.tempMinCelcius];
        self.weatherMax = [NSString stringWithFormat:@"%0.0f\u00B0", weatherCondition.tempMaxCelcius];
        self.weatherCurrent = [NSString stringWithFormat:@"%0.0f\u00B0", weatherCondition.tempCelsius];
        
        NSDateFormatter *formatter = ((AppDelegate *)[UIApplication sharedApplication].delegate).dateFormatter;
        formatter.dateFormat = @"EEE dd/MM/yyyy";
        self.todayDateString = [formatter stringFromDate:weatherCondition.time];
    }
    return self;
}

@end
