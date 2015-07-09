//
//  CityHeaderImageView.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityHeaderImageView.h"
#import "UIImageView+WebCache.h"

@interface CityHeaderImageView ()

@property (nonatomic, strong) UIImageView *cityImageView;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UIView *overlayView;

@end

@implementation CityHeaderImageView

- (void)setupView {
    self.cityImageView = [[UIImageView alloc] init];
    self.cityImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.cityImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.cityImageView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.cityImageView];
    
    self.overlayView = [[UIView alloc] init];
    self.overlayView.translatesAutoresizingMaskIntoConstraints = NO;
    self.overlayView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.overlayView];
    
    self.cityLabel = [[UILabel alloc] init];
    self.cityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.cityLabel.textColor = [UIColor whiteColor];
    self.cityLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.];
    [self addSubview:self.cityLabel];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_overlayView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_overlayView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_overlayView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_overlayView)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_cityImageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_cityImageView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_cityImageView(200)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_cityImageView)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(>=40)-[_cityLabel]-(>=40)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_cityLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(27)-[_cityLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_cityLabel)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.cityLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.overlayView && self.overlayView.layer.sublayers.count == 0) {
        CAGradientLayer *layer = [CAGradientLayer layer];
        layer.frame = self.overlayView.bounds;
        layer.colors = [NSArray arrayWithObjects:(id)[UIColor blackColor].CGColor, (id)[UIColor clearColor].CGColor, nil];
        layer.startPoint = CGPointMake(0.0f, 0.0f);
        layer.endPoint = CGPointMake(0.3f, 1.0f);
        [self.overlayView.layer insertSublayer:layer atIndex:0];
    }
}

- (void)awakeFromNib {
    [self setupView];
    self.cityLabel.text = self.name;
}

- (void)prepareForInterfaceBuilder {
    [self setupView];
    self.cityLabel.text = self.name;
}

- (void)setName:(NSString *)name {
    _name = name;
    self.cityLabel.text = name;
}

- (void)setImageUrl:(NSURL *)imageUrl {
    _imageUrl = imageUrl;
    [self.cityImageView sd_setImageWithURL:self.imageUrl];
}

@end
