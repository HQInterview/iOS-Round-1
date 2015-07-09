//
//  CityViewModel.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityViewModel.h"
#import "CityTableViewCellModel.h"
#import "City.h"
#import "Country.h"

@interface CityViewModel ()

@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, readwrite) NSArray *cellModels;
@property (nonatomic, readwrite) NSString *viewTitle;
@property (nonatomic, readwrite) NSURL *countryImageUrl;

@end

@implementation CityViewModel

- (instancetype)initWithCountry:(Country *)country withCoverSize:(CGSize)coverSize {
    self = [super init];
    if (self) {
        self.cities = country.cities;
        self.viewTitle = country.countryName;
        
        NSString *coverEdittedUrl = [country.coverImageUrl stringByReplacingOccurrencesOfString:@"{width}" withString:[NSString stringWithFormat:@"%0.0f", coverSize.width]];
        coverEdittedUrl = [coverEdittedUrl stringByReplacingOccurrencesOfString:@"{height}" withString:[NSString stringWithFormat:@"%0.0f", coverSize.width]];
        self.countryImageUrl = [NSURL URLWithString:coverEdittedUrl];
        [self initialize];
    }
    return self;
}

- (void)initialize {
    NSMutableArray *models = [NSMutableArray array];
    for (City *city in self.cities) {
        [models addObject:[[CityTableViewCellModel alloc] initWithCity:city]];
    }
    self.cellModels = models;
}

- (City *)cityAtIndex:(NSInteger)index {
    return [self.cities objectAtIndex:index];
}

@end
