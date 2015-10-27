//
//  CountriesAPI.h
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CountryModel.h"

@interface CountriesAPI : NSObject

+ (CountriesAPI *)sharedInstance;

-(NSArray*) countries;
-(CountryModel *) country:(NSArray *) arrayOfCountries index:(NSUInteger) index;

@end
