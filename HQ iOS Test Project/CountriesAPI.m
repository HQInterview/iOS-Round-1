//
//  CountriesAPI.m
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import "CountriesAPI.h"

@interface CountriesAPI ()
{
    NSArray *countries;
}

@end

@implementation CountriesAPI

+ (CountriesAPI *)sharedInstance
{
    static CountriesAPI * _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[CountriesAPI alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"country_data" ofType:@"json"];
        NSError *error = nil;
        NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
        id JSONObject = [NSJSONSerialization
                         JSONObjectWithData:JSONData
                         options:NSJSONReadingAllowFragments
                         error:&error];
        
        if ([JSONObject isKindOfClass:[NSDictionary class]]) {
            countries = [JSONObject objectForKey:@"countries"];
        }

    }
    return self;
}

- (NSArray *)countries
{
    return countries;
}

-(CountryModel *) country:(NSArray *) arrayOfCountries index:(NSUInteger) index;{
    CountryModel* country;
    
    country= [[CountryModel alloc] initWithCountryName:[arrayOfCountries[index] objectForKey:@"country_name"] flag_image_url:[arrayOfCountries[index] objectForKey:@"flag_image_url"] cities:[arrayOfCountries[index] objectForKey:@"cities"]];
    
    return country;
}


@end
