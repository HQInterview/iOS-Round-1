//
//  CountryViewController.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CountryViewController.h"
#import "CountryViewModel.h"
#import "CountryTableViewCell.h"
#import "CountryTableViewCellModel.h"

#import "CityViewModel.h"
#import "CityViewController.h"

#define CELL_IDENTIFIER @"CountryTableViewCell"

@interface CountryViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) CountryViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CountryViewController

- (instancetype)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    if (!self.tableView) {
        self.tableView = [[UITableView alloc] init];
        self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorInset = UIEdgeInsetsZero;
        
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;
        
        [self.tableView registerNib:[UINib nibWithNibName:CELL_IDENTIFIER bundle:nil] forCellReuseIdentifier:CELL_IDENTIFIER];
        
        [self.view addSubview:self.tableView];
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CountryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    [cell bindViewModel:self.viewModel.cellModels[indexPath.row]];
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CityViewModel *cityViewModel = [[CityViewModel alloc] initWithCountry:[self.viewModel countryAtIndex:indexPath.row] withCoverSize:CGSizeMake(screenWidth, 100)];
    CityViewController *cityViewController = [[CityViewController alloc] initWithViewModel:cityViewModel];
    [self.navigationController pushViewController:cityViewController animated:YES];
    
}

@end
