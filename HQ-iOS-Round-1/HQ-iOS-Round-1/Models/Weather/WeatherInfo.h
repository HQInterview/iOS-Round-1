//
//  WeatherInfo.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/23/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherInfo : NSObject

@property (nonatomic , assign) NSInteger humidity;
@property (nonatomic , strong) NSString *iconUrl;
@property (nonatomic , assign) double latitude;
@property (nonatomic , assign) double longitude;
@property (nonatomic , strong) NSString *summary;
@property (nonatomic , strong) NSString *tempCelsius;
@property (nonatomic , strong) NSString *tempMaxCelcius;
@property (nonatomic , strong) NSString *tempMinCelcius;
@property (nonatomic , strong) NSString *time;
@property (nonatomic , strong) NSString *date;
@property (nonatomic , strong) NSString *dateTime;
@property (nonatomic , assign) BOOL isCurrently;

+ (WeatherInfo *)createWeatherInfo:(NSDictionary *)info;

@end
