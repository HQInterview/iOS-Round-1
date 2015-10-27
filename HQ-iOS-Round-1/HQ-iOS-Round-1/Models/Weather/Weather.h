//
//  Weather.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/23/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherInfo.h"

@interface Weather : NSObject
{
    NSDictionary *dailyWeather;
    WeatherInfo *currentWeather;
}

+ (Weather *)getWeatherWithData:(NSDictionary *)weatherData;

- (NSInteger)numberOfDailyDate;

- (NSArray *)getDailyDateKeys;

- (NSString *)dailyKeyAtIndex:(NSInteger)index;

- (WeatherInfo *)weatherOnDate:(NSString *)date;

- (WeatherInfo *)getCurrentWeather;

@end
