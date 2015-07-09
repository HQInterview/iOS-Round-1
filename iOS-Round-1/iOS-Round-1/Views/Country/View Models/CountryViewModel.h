//
//  CountryViewModel.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Country;
@interface CountryViewModel : NSObject

@property (nonatomic, readonly) NSArray *cellModels;
@property (nonatomic, readonly) NSString *viewTitle;

- (instancetype)initWithCountries:(NSArray *)countries;

- (Country *)countryAtIndex:(NSInteger)index;
- (NSArray *)citiesAtRow:(NSInteger)row;

@end
