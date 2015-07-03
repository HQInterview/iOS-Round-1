//
//  Country.m
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/2/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "Country.h"

@implementation Country

-(id) initWithParameter:(NSDictionary *) country
{
    self.countryName = country[@"country_name"];
    self.flagImageURL = country[@"flag_image_url"];
    self.coverImgURL = country[@"cover_image_url"];
    self.coverImgURL = [self.coverImgURL stringByReplacingOccurrencesOfString:@"{width}" withString:@"500"];
    self.coverImgURL = [self.coverImgURL stringByReplacingOccurrencesOfString:@"{height}" withString:@"500"];
    
    self.citiesArray = [[NSMutableArray alloc] init];
    
    id cities = country[@"cities"];
    for (NSDictionary* cityParam in cities) {
        NSString* cityName = cityParam[@"city_name"];
        if ((int)cityName.length > 0) {
            City* city = [[City alloc] initWithParameter:cityParam];
            [self.citiesArray addObject:city];
        }
    }
   
    return self;
}
@end
