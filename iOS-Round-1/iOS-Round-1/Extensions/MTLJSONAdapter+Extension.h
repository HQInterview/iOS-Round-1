//
//  MTLJSONDataTransformer.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface MTLJSONAdapter (DateTime)

+ (NSValueTransformer *)dateTimeJSONTransformer;

@end
