//
//  CountryModel.h
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryModel : NSObject

@property (strong, nonatomic) NSString* flag_image_url;
@property (strong, nonatomic) NSString* country_name;
@property (strong, nonatomic) NSArray* cities;

- (id)initWithCountryName:(NSString *)country_name
           flag_image_url:(NSString *)flag_image_url
                   cities:(NSArray *)cities;

@end
