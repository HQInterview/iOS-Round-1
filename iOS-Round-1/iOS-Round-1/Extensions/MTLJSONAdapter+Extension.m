//
//  MTLJSONDataTransformer.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "MTLJSONAdapter+Extension.h"

@implementation MTLJSONAdapter (DateTime)

+ (NSValueTransformer *)dateTimeJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [MTLJSONAdapter dateFromJSONValue:value];
    }];
}

+ (NSDate *)dateFromJSONValue:(NSString *)value {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"ICT"]];
    NSDate *convertedDate = [formatter dateFromString:value];
    return convertedDate;
}

@end
