//
//  CityInfo.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/23/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "CityInfo.h"
#import "HQKeys.h"

@implementation CityInfo

+ (CityInfo *)createCityInfo:(NSDictionary *)info {
    CityInfo *city = [[CityInfo alloc] init];
    city.cityID = [info[KEY_CITY_ID] integerValue];
    city.name = info[KEY_CITY_NAME];
    city.isActive = [info[KEY_CITY_ACTIVE_FLAG] boolValue];
    city.weather = [Weather getWeatherWithData:info[KEY_WEATHER]];
    return city;
}

@end
