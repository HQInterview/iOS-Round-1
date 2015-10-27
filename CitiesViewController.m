//
//  CitiesViewController.m
//  HQ iOS Test Project
//
//  Created by tezadm on 10/27/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import "CitiesViewController.h"
#import "WeatherViewController.h"
#import "CityModel.h"

@interface CitiesViewController () <UITableViewDataSource, UITableViewDelegate>
{
    
    CityModel* city;
    NSInteger i;

}
@end

@implementation CitiesViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"CITIES";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:@"Cell"];
    }
    
    city= [[CityModel alloc] initWithCityName:[self.cities[indexPath.row] objectForKey:@"city_name"] weather:[self.cities[indexPath.row] objectForKey:@"weather"]];
    cell.textLabel.text=city.city_name;
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    i=indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self performSegueWithIdentifier:@"WeatherSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"WeatherSegue"]) {
        city= [[CityModel alloc] initWithCityName:[self.cities[i] objectForKey:@"city_name"] weather:[self.cities[i] objectForKey:@"weather"]];
        WeatherViewController* destViewController = segue.destinationViewController;
        destViewController.weather = city.weather;
    }
}

@end
