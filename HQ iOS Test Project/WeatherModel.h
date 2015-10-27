//
//  WeatherModel.h
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property (strong, nonatomic) NSString* summary;
@property (strong, nonatomic) NSString* iconUrl;
@property (strong, nonatomic) NSString* tempMaxCelcius;
@property (strong, nonatomic) NSString* tempCelcius;
@property (strong, nonatomic) NSString* tempMinCelcius;

- (id)initWithForecastForTheDay:(NSDictionary *)forecastForTheDay;

@end
