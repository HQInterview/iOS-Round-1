//
//  Weather.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/23/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "Weather.h"
#import "HQKeys.h"

static NSInteger visibleWeather = 5;

@implementation Weather

+ (Weather *)getWeatherWithData:(NSDictionary *)weatherData {
    return [[Weather alloc] initWithData:weatherData];
}

- (id)initWithData:(NSDictionary *)weatherData {
    if (self = [super init]) {
        [self setupWeatherData:weatherData];
    }
    return self;
}

- (void)setupWeatherData:(NSDictionary *)weatherData {
    NSDictionary *currently = weatherData[KEY_WEATHER_CURRENTLY];
    NSDictionary *daily = weatherData[KEY_WEATHER_DAILY];

    WeatherInfo *aCurrentWeather = [WeatherInfo createWeatherInfo:currently];
    NSMutableDictionary *newDictWeather = [NSMutableDictionary dictionary];

    for (NSString *key in daily) {
        WeatherInfo *aWeather = [WeatherInfo createWeatherInfo:daily[key]];
        
        if ([aWeather.dateTime caseInsensitiveCompare:aCurrentWeather.dateTime] == NSOrderedSame) {
            aWeather.isCurrently = true;
            currentWeather = aCurrentWeather;
            [newDictWeather setObject:aWeather forKey:key];
        }else if ([aWeather.dateTime caseInsensitiveCompare:aCurrentWeather.dateTime] == NSOrderedDescending) { // check for not include later date than currently
            [newDictWeather setObject:aWeather forKey:key];
        }
    }
    
    dailyWeather = [NSDictionary dictionaryWithDictionary:newDictWeather];
}

- (NSInteger)numberOfDailyDate {
    NSInteger count = [dailyWeather allKeys].count;
    return (count > visibleWeather)?visibleWeather:count; // show only 5 days or lower
}

- (NSArray *)getDailyDateKeys {
    NSArray *keys = [dailyWeather allKeys];
    keys = [keys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    return keys;
}

- (NSString *)dailyKeyAtIndex:(NSInteger)index {
    return [self getDailyDateKeys][index];
}

- (WeatherInfo *)getCurrentWeather {
    return currentWeather;
}

- (WeatherInfo *)weatherOnDate:(NSString *)date {
    return dailyWeather[date];
}


@end
