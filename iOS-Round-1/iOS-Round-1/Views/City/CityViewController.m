//
//  CityViewController.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityViewController.h"
#import "CityViewModel.h"
#import "CityTableViewCell.h"

#import "CityWeatherViewModel.h"
#import "CityWeatherViewController.h"

#import "CityHeaderImageView.h"

#define CELL_IDENTIFIER @"CityTableViewCell"

@interface CityViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) CityViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet CityHeaderImageView *cityHeaderView;

@end

@implementation CityViewController

- (instancetype)initWithViewModel:(CityViewModel *)viewModel {
    self = [super initWithNibName:@"CityViewController" bundle:nil];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cityHeaderView.name = self.viewModel.viewTitle;
    self.cityHeaderView.imageUrl = self.viewModel.countryImageUrl;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerClass:[CityTableViewCell class] forCellReuseIdentifier:CELL_IDENTIFIER];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    [cell bindViewModel:self.viewModel.cellModels[indexPath.row]];
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    City *selectedCity = [self.viewModel cityAtIndex:indexPath.row];
    CityWeatherViewModel *weatherViewModel = [[CityWeatherViewModel alloc] initWithCity:selectedCity andCountryImageUrl:self.viewModel.countryImageUrl];
    CityWeatherViewController *weahterViewController = [[CityWeatherViewController alloc] initWithViewModel:weatherViewModel];
    [self.navigationController pushViewController:weahterViewController animated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
