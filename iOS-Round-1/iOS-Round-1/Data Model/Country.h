//
//  Country.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Country : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSInteger countryID;
@property (nonatomic, readonly) NSString *countryName;
@property (nonatomic, readonly) NSString *flagUrl;

/**
 
 The cover image url's size should be replaced
 ex. https://photos.hotelquickly.com/images/country/australia.jpg?1=1&ext=jpg&quality=70&w={width}&h={height}
 
 */

@property (nonatomic, readonly) NSString *coverImageUrl;
@property (nonatomic, readonly) NSArray *cities;

@end
