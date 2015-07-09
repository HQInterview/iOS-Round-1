//
//  CountryReader.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CountryReader.h"
#import "Country.h"
#import <Mantle/Mantle.h>

@implementation CountryReader

+ (NSArray *)countriesFromFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"country_data" ofType:@"json"];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *countriesArray = json[@"countries"];
    NSArray *countries = [MTLJSONAdapter modelsOfClass:[Country class] fromJSONArray:countriesArray error:&error];
    return countries;
}


@end
