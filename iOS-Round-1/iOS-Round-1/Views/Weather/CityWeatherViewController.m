//
//  CityWeatherViewController.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityWeatherViewController.h"
#import "CityWeatherNowViewModel.h"
#import "CityWeatherNowView.h"
#import "CityWeatherViewModel.h"

#import "CityWeatherTableViewCell.h"
#import "CityWeatherTableViewCellModel.h"

#import "Weather.h"
#import "UIImageView+WebCache.h"

@interface CityWeatherViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) CityWeatherViewModel *viewModel;
@property (weak, nonatomic) IBOutlet CityWeatherNowView *nowView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


@end

@implementation CityWeatherViewController

- (instancetype)initWithViewModel:(CityWeatherViewModel *)viewModel {
    self = [super initWithNibName:@"CityWeatherViewController" bundle:nil];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    CityWeatherNowViewModel *nowViewModel = [[CityWeatherNowViewModel alloc] initWithTitle:self.viewModel.viewTitle weatherCondition:self.viewModel.nowWeather];
    [self.nowView bindViewModel:nowViewModel];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CityWeatherTableViewCell" bundle:nil] forCellReuseIdentifier:@"CityWeatherTableViewCell"];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = [[UIView alloc] init];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 10, 0)];
    [self.tableView setScrollIndicatorInsets:UIEdgeInsetsMake(0, 0, 10, 0)];
    
    [self.backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.backgroundImageView sd_setImageWithURL:self.viewModel.countryImageUrl];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityWeatherTableViewCell"];
    CityWeatherTableViewCellModel *cellModel = [self.viewModel.forecastCellModels objectAtIndex:indexPath.row];
    [cell bindViewModel:cellModel];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.forecastCellModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
