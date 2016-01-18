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
@property (strong, nonatomic) NSMutableArray *fadedInMutableArray;

@end

@implementation CitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.country.country_name;
    self.fadedInMutableArray = [NSMutableArray new];
    self.cityMutableArray = [NSMutableArray new];
    [self createGradientBackground];
    self.citiesTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self retrieveCityInfoFromSelectedCountry];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
}

    
-(void)createGradientBackground {
    
    [self.citiesTableView setBackgroundColor:[UIColor clearColor]];
    UIColor *topColor = [UIColor colorWithRed:0.11 green:0.17 blue:0.39 alpha:1];
    UIColor *bottomColor = [UIColor colorWithRed:0.97 green:0.80 blue:0.86 alpha:1];
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    gradientLayer.frame = self.view.frame;
    
    UIView *gradientView = [[UIView alloc] initWithFrame:self.view.bounds];
    [gradientView.layer addSublayer:gradientLayer];
    
    [self.view addSubview:gradientView];
    [self.view sendSubviewToBack:gradientView];
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

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (![self.fadedInMutableArray containsObject:indexPath]) {
        
        cell.alpha = 0;
        
        [UIView animateWithDuration:1 animations:^{
            cell.alpha = 1.0f;
            [self.fadedInMutableArray addObject:indexPath];
        }];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
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
