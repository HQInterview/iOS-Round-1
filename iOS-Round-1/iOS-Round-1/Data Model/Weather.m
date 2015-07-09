//
//  Weather.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "Weather.h"
#import "WeatherCondition.h"
#import "WeatherForecast.h"
#import "MTLJSONAdapter+Extension.h"

@implementation Weather

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"currentWeather": @"currently",
             @"forecastWeathers" : @"daily"};
}

+ (NSValueTransformer *)currentWeatherJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[WeatherCondition class]];
}

+ (NSValueTransformer *)forecastWeathersJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSDictionary *value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *transformmedValue = [NSMutableArray array];
        for (NSString *key in value.allKeys) {
            WeatherCondition *weatherCondition = [MTLJSONAdapter modelOfClass:[WeatherCondition class] fromJSONDictionary:value[key] error:nil];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd"];
            [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"ICT"]];

            NSDate *time = [formatter dateFromString:key];
            [transformmedValue addObject:[[WeatherForecast alloc] initWithTime:time andWeather:weatherCondition]];
        }
        return [transformmedValue sortedArrayUsingComparator:^NSComparisonResult(WeatherForecast *obj1, WeatherForecast *obj2) {
            return [obj1.timeStamp compare:obj2.timeStamp];
        }];
    }];
}

@end
