//
//  ImageCache.m
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/3/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "ImageCache.h"

@implementation ImageCache

@synthesize imgCache;


-(id)loadImage:(NSURL *)key
{
    return [self.imgCache objectForKey:key];
}

-(void)cacheImage:(NSURL*)imgURL image:(UIImage*)image
{
        //imgCache.setObject(image, forKey: imageURL)
    [self.imgCache setObject:image forKey:imgURL];
    
}


+ (id)sharedInstance
{
    static ImageCache* _sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

-(id)init {
    if (self = [super init]) {
        self.imgCache = [[NSCache alloc] init];
        [self.imgCache setCountLimit:100];
    }
    return self;
}

@end
