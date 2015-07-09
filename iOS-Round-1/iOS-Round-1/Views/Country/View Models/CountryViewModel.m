//
//  CountryViewModel.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CountryViewModel.h"
#import "Country.h"
#import "CountryTableViewCellModel.h"

@interface CountryViewModel ()

@property (nonatomic, strong) NSArray *countries;
@property (nonatomic, readwrite) NSArray *cellModels;
@property (nonatomic, readwrite) NSString *viewTitle;

@end

@implementation CountryViewModel

- (instancetype)initWithCountries:(NSArray *)countries {
    self = [super init];
    if (self) {
        self.countries = countries;
        self.viewTitle = @"Country";
        [self initialize];
    }
    return self;
}

- (void)initialize {
    NSMutableArray *models = [NSMutableArray array];
    for (Country *country in self.countries) {
        [models addObject:[[CountryTableViewCellModel alloc] initWithCountry:country]];
    }
    self.cellModels = models;
}

- (Country *)countryAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.countries.count) {
        return [self.countries objectAtIndex:index];
    }
    return nil;
}

- (NSArray *)citiesAtRow:(NSInteger)row {
    Country *country = (row >= 0 && row < self.countries.count)? self.countries[row] : nil;
    if (country) {
        return country.cities;
    }
    return nil;
}

@end
