//
//  CityModel.m
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

- (id)initWithCityName:(NSString *)city_name
                  weather:(NSDictionary *)weather
{
    
    self = [super init];
    if (self)
    {
        _city_name = city_name;
        _weather = [[NSDictionary alloc] initWithDictionary:weather];
    }
    return self;
    
}

@end
