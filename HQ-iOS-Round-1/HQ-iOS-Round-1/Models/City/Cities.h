//
//  Cities.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/22/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityInfo.h"

@interface Cities : NSObject
{
    NSArray *cities;
}

+ (Cities *)getCitiesWithData:(NSArray *)citiesData;

- (NSInteger)numberOfCities;

- (CityInfo *)cityAtIndex:(NSInteger)index;

@end
