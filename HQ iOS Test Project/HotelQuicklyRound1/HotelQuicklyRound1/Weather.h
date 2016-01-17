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
@property float max_temp;
@property float min_temp;
@property (strong, nonatomic) NSString *summary;

@end
