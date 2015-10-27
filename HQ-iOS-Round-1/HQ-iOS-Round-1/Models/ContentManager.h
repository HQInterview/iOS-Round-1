//
//  ContentManager.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/22/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Countries.h"
#import "Cities.h"
#import "Weather.h"

@interface ContentManager : NSObject

@property (nonatomic , strong) Countries *countries;
@property (nonatomic , strong) Cities *cities;
@property (nonatomic , strong) Weather *weather;

@property (nonatomic , strong) CountryInfo *selectedCountry;
@property (nonatomic , strong) CityInfo *selectedCity;

+ (ContentManager *)sharedInstance;

@end
