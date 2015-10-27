//
//  ViewController.m
//  HQ iOS Test Project
//
//  Created by tezadm on 10/26/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import "ViewController.h"
#import "CountriesAPI.h"
#import "CountryModel.h"
#import "CitiesViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray * allCountries;
    CountryModel *country;
    NSInteger i;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"COUNTRIES";
    
    allCountries = [[CountriesAPI sharedInstance] countries];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [allCountries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:@"Cell"];
    }
    
    country= [[CountriesAPI sharedInstance] country:allCountries index:indexPath.row];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:country.flag_image_url]]];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:101];
    titleLabel.text =country.country_name;
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    i=indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self performSegueWithIdentifier:@"DetailsSegue" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailsSegue"]) {

        country= [[CountriesAPI sharedInstance] country:allCountries index:i];
        CitiesViewController *destViewController = segue.destinationViewController;
        destViewController.cities = country.cities;
    }
}


@end
