//
//  City.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@class Weather;
@interface City : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSInteger cityID;
@property (nonatomic, readonly) NSString *cityName;
@property (nonatomic, readonly) BOOL isActiveFlag;
@property (nonatomic, readonly) NSArray *suggestedCities;
@property (nonatomic, readonly) Weather *weather;

@end
