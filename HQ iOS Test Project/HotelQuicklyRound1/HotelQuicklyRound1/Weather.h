//
//  Weather.h
//  HotelQuicklyRound1
//
//  Created by Ang Jian Yao on 17/01/2016.
//  Copyright © 2016 Ang Jian Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (strong, nonatomic) NSString *iconUrl;
@property (strong, nonatomic) NSString *max_temp;
@property (strong, nonatomic) NSString *min_temp;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *timeString;

@end
