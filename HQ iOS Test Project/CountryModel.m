//
//  CountryModel.m
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import "CountryModel.h"

@implementation CountryModel

- (id)initWithCountryName:(NSString *)country_name
           flag_image_url:(NSString *)flag_image_url
                   cities:(NSArray *)cities
{
    self = [super init];
    if (self)
    {
        _country_name = country_name;
        _flag_image_url = flag_image_url;
        _cities = [[NSArray alloc] initWithArray:cities];
    }
    return self;
}

@end
