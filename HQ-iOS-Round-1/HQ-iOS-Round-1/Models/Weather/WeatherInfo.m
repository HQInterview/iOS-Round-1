//
//  WeatherInfo.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/23/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "WeatherInfo.h"
#import "HQKeys.h"

@implementation WeatherInfo

+ (WeatherInfo *)createWeatherInfo:(NSDictionary *)info {
    WeatherInfo *weather = [[WeatherInfo alloc] init];
    weather.humidity = [info[KEY_WEATHER_HUMIDITY] integerValue];
    weather.iconUrl = info[KEY_WEATHER_ICON_URL];
    weather.latitude = [info[KEY_WEATHER_LATITUDE] doubleValue];
    weather.longitude = [info[KEY_WEATHER_LONGITUDE] doubleValue];
    weather.summary = info[KEY_WEATHER_SUMMARY];
    weather.tempCelsius = [weather tempFormatToString:info[KEY_WEATHER_TEMP]];
    weather.tempMaxCelcius = [weather tempFormatToString:info[KEY_WEATHER_TEMP_MAX]];
    weather.tempMinCelcius = [weather tempFormatToString:info[KEY_WEATHER_TEMP_MIN]];
    weather.isCurrently = false;
    
    NSString *dateTime = info[KEY_WEATHER_TIME];
    weather.dateTime = dateTime;

    NSArray *arrayDateTime = [dateTime componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (arrayDateTime.count == 2) {
        weather.date = [weather convertDateToFormatWithDate:arrayDateTime[0]];
        weather.time = arrayDateTime[1];
    }
    
    return weather;
}

- (NSString *)tempFormatToString:(id)temp {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@"0º"];

    return [formatter stringFromNumber:[NSNumber numberWithDouble:[temp doubleValue]]];
}


- (NSString *)convertDateToFormatWithDate:(NSString *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YY-MM-DD"];
    NSDate *dateTmp = [formatter dateFromString:date];
    
    NSDateFormatter *resultFormatter = [[NSDateFormatter alloc] init];
    [resultFormatter setDateFormat:@"EEEE, DD"];
    return [resultFormatter stringFromDate:dateTmp];
}

@end
