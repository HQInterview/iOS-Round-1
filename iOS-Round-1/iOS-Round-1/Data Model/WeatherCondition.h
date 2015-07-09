//
//  WeatherCondition.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface WeatherCondition : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) double humidity;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;
@property (nonatomic, readonly) NSString *iconUrl;
@property (nonatomic, readonly) double tempMaxCelcius;
@property (nonatomic, readonly) double tempCelsius;
@property (nonatomic, readonly) double tempMinCelcius;
@property (nonatomic, readonly) NSDate *time;

@end
