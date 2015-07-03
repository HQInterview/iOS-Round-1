//
//  ImageCache.h
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/3/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageCache : NSObject {
    NSCache* imgCache;
}

@property (nonatomic, retain) NSCache* imgCache;

+(id)sharedInstance;

-(void)cacheImage:(NSURL*)imgURL image:(UIImage*)image;
-(id)loadImage:(NSURL *)key;

@end
