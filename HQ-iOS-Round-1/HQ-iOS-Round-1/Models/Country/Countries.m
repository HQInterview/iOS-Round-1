//
//  Countries.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/22/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "Countries.h"

@implementation Countries

+ (Countries *)getCountriesWithData:(NSArray *)countriesData {

    return [[Countries alloc] initWithData:countriesData];
}

- (id)initWithData:(NSArray *)countriesData {
    if (self = [super init]) {
        [self setupCountriesData:countriesData];
    }
    return self;
}

- (void)setupCountriesData:(NSArray *)countriesData {
    NSMutableArray *newArrayCountries = [NSMutableArray array];
    for (NSDictionary *info in countriesData) {
        [newArrayCountries addObject:[CountryInfo createCountryInfo:info]];
    }
    countries = [NSArray arrayWithArray:newArrayCountries];
}

- (NSInteger)numberOfCountries {
    return countries.count;
}

- (CountryInfo *)countryAtIndex:(NSInteger)index {
    return countries[index];
}

@end
