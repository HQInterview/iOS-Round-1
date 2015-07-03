//
//  ViewController.m
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/2/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)unwindFromCityListViewController:(UIStoryboardSegue *)sender {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _myImageCache = [ImageCache sharedInstance];
    
    [self fetchJSON];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];

    NSLog(@"Hello World");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) fetchJSON
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"country_data" ofType:@"json"];
    NSString* countryJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    countryJSON = [countryJSON stringByReplacingOccurrencesOfString:@"NULL," withString:@"\"\","];
    
    NSUInteger firstCurlyBracePos = [countryJSON rangeOfString:@"[" options:0].location;
    NSUInteger lastCurlyBracePos = [countryJSON rangeOfString:@"]" options: NSBackwardsSearch].location;
    
    NSString* jsonString = nil;
    if(firstCurlyBracePos != NSNotFound && lastCurlyBracePos != NSNotFound) {
        jsonString = [countryJSON substringWithRange:NSMakeRange(firstCurlyBracePos, lastCurlyBracePos-firstCurlyBracePos + 1)];
    }
    
    id countriesObject = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    
    self.countriesArray = [[NSMutableArray alloc] init];
    for (NSDictionary* countryParam in countriesObject) {
        Country* country = [[Country alloc] initWithParameter:countryParam];
        [self.countriesArray addObject:country];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.countriesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CountryCell *cell = (CountryCell *)[tableView dequeueReusableCellWithIdentifier:@"CountryCell"];
    
    if ((int) [self.countriesArray count] < 0) {
        return cell;
    }
    
    
    Country* countryObj = [self.countriesArray objectAtIndex:indexPath.row];
    cell.countryLabel.text = countryObj.countryName;
    cell.flagImgView.image = nil;
    NSURL* flagURL = [NSURL URLWithString:countryObj.flagImageURL];
    UIImage* flagImage = [self.myImageCache loadImage:flagURL];
    
    if (flagImage != nil) {
         cell.flagImgView.image = flagImage;
    } else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),  ^{
            
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:flagURL]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.myImageCache cacheImage:flagURL image:image];
                cell.flagImgView.image = image;
            });
        });
    }
    [self backdroundLoadImage:[NSURL URLWithString:countryObj.coverImgURL]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"cityListView"]) {
        CityListViewController* vc = [segue destinationViewController];
        NSIndexPath* index = [self.tableView indexPathForSelectedRow];
        Country* countryObj = [self.countriesArray objectAtIndex:index.row];
        
        vc.countryName = countryObj.countryName;
        vc.coverImgURL = countryObj.coverImgURL;
        vc.citiesArray = [countryObj.citiesArray copy];
    }
}
-(void) backdroundLoadImage:(NSURL *)imgURL
{
    UIImage* image = [self.myImageCache loadImage:imgURL];
    
    if (image == nil) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0),  ^{
            UIImage *bgImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imgURL]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.myImageCache cacheImage:imgURL image:bgImage];
            });
        });
    }
}
@end
