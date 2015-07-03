//
//  City.m
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/2/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "City.h"

@implementation City

-(id) initWithParameter:(NSDictionary *) city
{
    self.cityName = city[@"city_name"];
    self.currentWeather = [[Weather alloc] initWithParameter:city[@"weather"][@"currently"]];
    
    return self;
}
@end
