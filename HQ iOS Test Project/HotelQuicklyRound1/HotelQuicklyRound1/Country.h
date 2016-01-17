//
//  Country.h
//  HotelQuicklyRound1
//
//  Created by Ang Jian Yao on 17/01/2016.
//  Copyright © 2016 Ang Jian Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (strong, nonatomic) NSNumber *country_id;
@property (strong, nonatomic) NSString *flag_image_url;
@property (strong, nonatomic) NSString *country_name;
@property (strong, nonatomic) NSString *cover_image_url;

@end
