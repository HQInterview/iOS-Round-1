//
//  CountryTableViewCellModel.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CountryTableViewCellModel.h"
#import "Country.h"

@interface CountryTableViewCellModel ()

@property (nonatomic, readwrite) NSString *cellTitle;
@property (nonatomic, readwrite) NSString *flagUrl;

@end

@implementation CountryTableViewCellModel

- (instancetype)initWithCountry:(Country *)country {
    self = [super init];
    if (self) {
        self.cellTitle = country.countryName;
        self.flagUrl = country.flagUrl;
    }
    return self;
}

@end
