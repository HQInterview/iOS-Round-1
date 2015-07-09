//
//  CityTableViewCellModel.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;
@interface CityTableViewCellModel : NSObject

@property (nonatomic, readonly) NSString *cellTitle;

- (instancetype)initWithCity:(City *)city;

@end
