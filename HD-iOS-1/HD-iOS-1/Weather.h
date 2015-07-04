//
//  Weather.h
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/2/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (nonatomic, strong) NSString* timeString;
@property (nonatomic, strong) NSString* iconURL;
@property (nonatomic, strong) NSString* summary;
@property (nonatomic, strong) NSString* tempCelsiusString;
@property (nonatomic, strong) NSString* tempMaxCelciusString;
@property (nonatomic, strong) NSString* tempMinCelciusString;

-(id) initWithParameter:(NSDictionary *) weather;

@end
