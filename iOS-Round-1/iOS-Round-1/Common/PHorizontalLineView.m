//
//  PHorizontalLineView.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/8/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "PHorizontalLineView.h"

@implementation PHorizontalLineView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib {
    [self setupView];
}

- (void)setupView {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:1 / [UIScreen mainScreen].scale]];
}

- (void)prepareForInterfaceBuilder {
    [self setupView];
}

@end
