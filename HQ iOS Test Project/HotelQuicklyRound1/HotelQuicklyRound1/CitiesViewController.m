//
//  CitiesViewController.m
//  HotelQuicklyRound1
//
//  Created by Ang Jian Yao on 17/01/2016.
//  Copyright © 2016 Ang Jian Yao. All rights reserved.
//

#import "CitiesViewController.h"
#import "DetailsViewController.h"
#import "City.h"

@interface CitiesViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *citiesTableView;
@property (strong, nonatomic) NSMutableArray *cityMutableArray;

@end

@implementation CitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.country.country_name;
    self.cityMutableArray = [NSMutableArray new];
    [self retrieveCityInfoFromSelectedCountry];

}

#pragma mark - table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cityMutableArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    City *city = [self.cityMutableArray objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CitiesCellID"];
    cell.textLabel.text = city.city_name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"ToDetailsVC" sender:nil];
    });
}


#pragma mark - city info
-(void)retrieveCityInfoFromSelectedCountry {
    
    for (NSDictionary *cityInSelectedCountry in self.country.cities) {
        
        City *city = [City new];
        city.city_name = [cityInSelectedCountry valueForKeyPath:@"city_name"];
        
        city.city_daily_weather = [cityInSelectedCountry valueForKeyPath:@"weather.daily"];
        
        if (![city.city_name isEqualToString:@"NULL"]) {
            [self.cityMutableArray addObject:city];
        }
    }

    
}

#pragma mark - segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ToDetailsVC"]) {
        
        NSIndexPath *indexPath = [self.citiesTableView indexPathForSelectedRow];
        City *selectedCity = [self.cityMutableArray objectAtIndex:indexPath.row];
        
        DetailsViewController *dvc = segue.destinationViewController;
        dvc.city = selectedCity;
    }
}

@end
