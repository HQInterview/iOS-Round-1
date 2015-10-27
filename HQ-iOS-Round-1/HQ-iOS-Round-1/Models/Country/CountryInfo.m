//
//  CountryInfo.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/22/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "CountryInfo.h"
#import "HQKeys.h"

@implementation CountryInfo

+ (CountryInfo *)createCountryInfo:(NSDictionary *)info {
    
    CountryInfo *country = [[CountryInfo alloc] init];
    country.name = info[KEY_COUNTRY_NAME];
    country.countryID = [info[KEY_COUNTRY_ID] integerValue];
    country.flagImageURL = [country replaceBaseFlageImageURL:info[KEY_COUNTRY_FLAG_URL]];
    country.coverImageURL = info[KEY_COUNTRY_COVER_URL];
    country.cities = [Cities getCitiesWithData:info[KEY_CITIES]];
    
    return country;
}

- (NSString *)coverImageURLWithWidth:(NSInteger)width height:(NSInteger)height {
    NSString *url = self.coverImageURL;
    url = [url stringByReplacingOccurrencesOfString:@"{width}" withString:[@(width) stringValue]];
    url = [url stringByReplacingOccurrencesOfString:@"{height}" withString:[@(height) stringValue]];
    return url;
}

- (NSString *)replaceBaseFlageImageURL:(NSString *)url {
    NSString *newURL = [url stringByReplacingOccurrencesOfString:@"d3xm8g2fmv6ji.cloudfront.net" withString:@"backend.hotelquickly.com"];
    return newURL;
}

@end
