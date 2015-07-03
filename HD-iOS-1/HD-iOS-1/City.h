//
//  City.h
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/2/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface City : NSObject

@property (nonatomic, strong) NSString* cityName;
@property (nonatomic, strong) Weather* currentWeather;
//@property (nonatomic, strong) NSMutableArray* weatherArray;

-(id) initWithParameter:(NSDictionary *) city;

@end
