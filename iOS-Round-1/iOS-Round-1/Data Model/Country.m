//
//  Country.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "Country.h"
#import "City.h"

@implementation Country

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"countryID" : @"country_id",
             @"countryName" : @"country_name",
             @"flagUrl" : @"flag_image_url",
             @"coverImageUrl" : @"cover_image_url",
             @"cities" : @"cities"};
}

+ (NSValueTransformer *)citiesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[City class]];
}

@end
