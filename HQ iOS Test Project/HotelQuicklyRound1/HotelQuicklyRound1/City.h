//
//  City.h
//  HotelQuicklyRound1
//
//  Created by Ang Jian Yao on 17/01/2016.
//  Copyright © 2016 Ang Jian Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface City : NSObject
@property (strong, nonatomic) NSString *city_name;
@property (strong, nonatomic) Weather *weather;

@end
