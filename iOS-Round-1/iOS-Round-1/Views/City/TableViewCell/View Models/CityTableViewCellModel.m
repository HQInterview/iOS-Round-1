//
//  CityTableViewCellModel.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityTableViewCellModel.h"
#import "City.h"

@interface CityTableViewCellModel ()

@property (nonatomic, readwrite) NSString *cellTitle;

@end

@implementation CityTableViewCellModel

- (instancetype)initWithCity:(City *)city {
    self = [super init];
    if (self) {
        self.cellTitle = city.cityName;
    }
    return self;
}

@end
