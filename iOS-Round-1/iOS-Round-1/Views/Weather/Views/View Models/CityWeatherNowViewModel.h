//
//  CityWeatherNowViewModel.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherCondition;
@interface CityWeatherNowViewModel : NSObject

@property (nonatomic, readonly) NSString *viewTitle;
@property (nonatomic, readonly) NSString *weatherUrl;
@property (nonatomic, readonly) NSString *weatherTitle;
@property (nonatomic, readonly) NSString *weatherMin;
@property (nonatomic, readonly) NSString *weatherMax;
@property (nonatomic, readonly) NSString *weatherCurrent;
@property (nonatomic, readonly) NSString *todayDateString;

- (instancetype)initWithTitle:(NSString *)title weatherCondition:(WeatherCondition *)weatherCondition;

@end
