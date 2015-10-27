//
//  Countries.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/22/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CountryInfo.h"

@interface Countries : NSObject
{
    NSArray *countries;
}

+ (Countries *)getCountriesWithData:(NSArray *)countriesData;

- (NSInteger)numberOfCountries;

- (CountryInfo *)countryAtIndex:(NSInteger)index;

@end
