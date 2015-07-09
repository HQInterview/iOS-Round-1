//
//  CityViewModel.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class City;
@class Country;
@interface CityViewModel : NSObject

@property (nonatomic, readonly) NSArray *cellModels;
@property (nonatomic, readonly) NSString *viewTitle;
@property (nonatomic, readonly) NSURL *countryImageUrl;

- (instancetype)initWithCountry:(Country *)country withCoverSize:(CGSize)coverSize;

- (City *)cityAtIndex:(NSInteger)index;

@end
