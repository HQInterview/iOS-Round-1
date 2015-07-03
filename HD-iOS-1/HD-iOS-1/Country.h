//
//  Country.h
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/2/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@interface Country : NSObject

@property (nonatomic, strong) NSString* countryName;
@property (nonatomic, strong) NSString* flagImageURL;
@property (nonatomic, strong) NSString* coverImgURL;
@property (nonatomic, strong) NSMutableArray* citiesArray;


-(id) initWithParameter:(NSDictionary *) country;

@end
