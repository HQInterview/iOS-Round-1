//
//  CityHeaderImageView.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CityHeaderImageView : UIView

@property (nonatomic, strong) IBInspectable NSString *name;
@property (nonatomic, strong) NSURL *imageUrl;

@end
