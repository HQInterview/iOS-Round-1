//
//  CityWeatherNowView.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityWeatherNowView.h"
#import "CityWeatherNowViewModel.h"
#import "UIImageView+WebCache.h"

@interface CityWeatherNowView ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherIconView;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTempValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTempValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTempValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *todayDateLabe;

@end

@implementation CityWeatherNowView

- (void)loadNibFile {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSArray *nibs = [bundle loadNibNamed:@"CityWeatherNowView" owner:self options:nil];
    UIView *nibView = [nibs firstObject];
    nibView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:nibView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[nibView]|" options:0 metrics:nil views:@{@"nibView" : nibView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[nibView]|" options:0 metrics:nil views:@{@"nibView" : nibView}]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self loadNibFile];
}

- (void)prepareForInterfaceBuilder {
    [self loadNibFile];
}

- (void)bindViewModel:(CityWeatherNowViewModel *)viewModel {
    self.titleLabel.text = viewModel.viewTitle;
    [self.weatherIconView sd_setImageWithURL:[NSURL URLWithString:viewModel.weatherUrl]];
    self.weatherLabel.text = viewModel.weatherTitle;
    self.minTempValueLabel.text = viewModel.weatherMin;
    self.maxTempValueLabel.text = viewModel.weatherMax;
    self.currentTempValueLabel.text = viewModel.weatherCurrent;
    self.todayDateLabe.text = viewModel.todayDateString;
}

@end
