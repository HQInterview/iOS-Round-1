//
//  CityInfo.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/23/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface CityInfo : NSObject

@property (nonatomic , assign) NSInteger cityID;
@property (nonatomic , strong) NSString *name;
@property (nonatomic , assign) BOOL isActive;
@property (nonatomic , strong) Weather *weather;

+ (CityInfo *)createCityInfo:(NSDictionary *)info;

@end
