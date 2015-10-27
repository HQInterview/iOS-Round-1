//
//  CountryInfo.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/22/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cities.h"

@interface CountryInfo : NSObject

@property (nonatomic , assign) NSInteger countryID;
@property (nonatomic , strong) NSString *name;
@property (nonatomic , strong) NSString *flagImageURL;
@property (nonatomic , strong) NSString *coverImageURL;
@property (nonatomic , strong) Cities *cities;

+ (CountryInfo *)createCountryInfo:(NSDictionary *)info;

- (NSString *)coverImageURLWithWidth:(NSInteger)width height:(NSInteger)height;

@end
