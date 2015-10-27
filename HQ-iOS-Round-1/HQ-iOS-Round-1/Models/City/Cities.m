//
//  Cities.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/22/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "Cities.h"

@implementation Cities

+ (Cities *)getCitiesWithData:(NSArray *)citiesData {
    return [[Cities alloc] initWithData:citiesData];
}

- (id)initWithData:(NSArray *)citiesData {
    if (self = [super init]) {
        [self setupCitiesData:citiesData];
    }
    return self;
}

- (void)setupCitiesData:(NSArray *)citiesData {
    NSMutableArray *newArrayCities = [NSMutableArray array];
    for (NSDictionary *info in citiesData) {
        if (![info[@"city_name"] isKindOfClass:[NSNull class]]) {
            [newArrayCities addObject:[CityInfo createCityInfo:info]];
        }
    }
    cities = [NSArray arrayWithArray:newArrayCities];
}

- (NSInteger)numberOfCities {
    return cities.count;
}

- (CityInfo *)cityAtIndex:(NSInteger)index {
    return cities[index];
}

@end
