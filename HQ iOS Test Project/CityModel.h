//
//  CityModel.h
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject

@property (strong, nonatomic) NSString* city_name;
@property (strong, nonatomic) NSDictionary* weather;

- (id)initWithCityName:(NSString *)city_name
                   weather:(NSDictionary *)weather;

@end
