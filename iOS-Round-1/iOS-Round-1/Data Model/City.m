//
//  City.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "City.h"
#import "Weather.h"

@implementation City

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"cityID" : @"city_id",
             @"cityName" : @"city_name",
             @"suggestedCities" : @"suggested_cities",
             @"isActiveFlag" : @"active_flag",
             @"weather" : @"weather"};
}

+ (NSValueTransformer *)suggestedCitiesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[City class]];
}

+ (NSValueTransformer *)weatherJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Weather class]];
}

@end
