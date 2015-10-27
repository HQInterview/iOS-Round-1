//
//  ContentManager.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/22/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "ContentManager.h"
#import "HQKeys.h"

@implementation ContentManager

+ (ContentManager *)sharedInstance {
    static dispatch_once_t once;
    static ContentManager *sharedInstance = nil;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] initWithDefault];
    });
    
    return sharedInstance;
}

- (id)initWithDefault {
    if (self = [super init]) {
        [self readJsonFromFile];
    }
    return self;
}

- (void)readJsonFromFile {
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"country_data" ofType:@"json"];
    NSData *dataFromFile = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:dataFromFile options:kNilOptions error:&error];
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }else {
        self.countries = [Countries getCountriesWithData:jsonData[KEY_COUNTRIES]];
    }
}

@end
