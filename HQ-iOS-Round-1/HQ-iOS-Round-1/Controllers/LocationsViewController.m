//
//  LocationsViewController.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/26/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "LocationsViewController.h"
#import "LocationHeaderViewCell.h"
#import "CityTableViewCell.h"

static NSString *headerIdentifier = @"headerIdentifier";
static NSString *cellIdentifier = @"expandCellIdentifier";

@interface LocationsViewController ()

@end

@implementation LocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    countries = [ContentManager sharedInstance].countries;
    
    if (!expandedSections) {
        expandedSections = [[NSMutableIndexSet alloc] init];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section {
    if (section >= 0) {
        return YES;
    }
    return NO;
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [countries numberOfCountries];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self tableView:tableView canCollapseSection:section]) {
        if ([expandedSections containsIndex:section]) {
            return [[countries countryAtIndex:section].cities numberOfCities];
        }
        return 0;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    [cell setCityInformation:[[countries countryAtIndex:indexPath.section].cities cityAtIndex:indexPath.row]];
    
    if (indexPath.row == [[countries countryAtIndex:indexPath.section].cities numberOfCities]-1) {
        [cell setDownlineHidden:true];
    }else {
        [cell setDownlineHidden:false];
    }
        
    return cell;
}

#pragma mark - TableView Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CountryInfo *aCountry = [countries countryAtIndex:section];
    LocationHeaderViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:headerIdentifier];
    headerView.delegate = self;
    
    [headerView setHeaderWithText:aCountry.name];
    [headerView setHeaderImageWithURL:aCountry.flagImageURL];
    [headerView setTag:section];

    if (section == 0) {
        [headerView setUplineHidden:true];
    }else {
        [headerView setUplineHidden:false];
    }
    
    UIView *view = [[UIView alloc] initWithFrame:[headerView frame]];
    headerView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [view addSubview:headerView];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    LocationHeaderViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:headerIdentifier];
    return [headerView getHeaderHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CityInfo *selectedCity = [[ContentManager sharedInstance].cities cityAtIndex:indexPath.row];
    [ContentManager sharedInstance].weather = selectedCity.weather;
    [ContentManager sharedInstance].selectedCity = selectedCity;
}

#pragma mark - Tap HeaderView

- (void)tapHeaderView:(LocationHeaderViewCell *)view section:(NSInteger)section {
    if ([self tableView:locationsTableView canCollapseSection:section]) {
        BOOL currentlyExpanded = [expandedSections containsIndex:section];
        
        [locationsTableView beginUpdates];
        if (currentlyExpanded) {
            [self deleteRowInSection:section];
            [expandedSections removeIndex:section];
            
            // delete row before clear data
            [ContentManager sharedInstance].cities = nil;
            [ContentManager sharedInstance].selectedCountry = nil;
                        
        }else {
            // delete older country cell
            NSInteger index = [expandedSections firstIndex];
            for (int i=0 ; i<expandedSections.count ; i++) {
                index = [expandedSections indexGreaterThanOrEqualToIndex:index];
                [self deleteRowInSection:index];
                [expandedSections removeIndex:index];
            }
            
            // add data before insert row
            CountryInfo *selectedCountry = [countries countryAtIndex:section];
            [ContentManager sharedInstance].cities = selectedCountry.cities;
            [ContentManager sharedInstance].selectedCountry = selectedCountry;
            
            [expandedSections addIndex:section];
            [self insertRowInsection:section];
        }
        
        [locationsTableView endUpdates];
        
        CGRect sectionRect = [locationsTableView rectForSection:section];
        sectionRect.size.height = locationsTableView.frame.size.height;
        [locationsTableView scrollRectToVisible:sectionRect animated:YES];
    }
}

- (void)deleteRowInSection:(NSInteger)section {
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSInteger rows = [[countries countryAtIndex:section].cities numberOfCities];
    for (int i=0; i<rows; i++) {
        NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [tmpArray addObject:tmpIndexPath];
    }
    [locationsTableView deleteRowsAtIndexPaths:tmpArray withRowAnimation:UITableViewRowAnimationTop];
}

- (void)insertRowInsection:(NSInteger)section {
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSInteger rows = [[countries countryAtIndex:section].cities numberOfCities];
    for (int i=0; i<rows; i++) {
        NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [tmpArray addObject:tmpIndexPath];
    }
    [locationsTableView insertRowsAtIndexPaths:tmpArray withRowAnimation:UITableViewRowAnimationTop];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
