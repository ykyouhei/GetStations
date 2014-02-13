//
//  ViewController.m
//  GetStations
//
//  Created by 山口 恭兵 on 2014/02/14.
//  Copyright (c) 2014年 Kyouhei Yamaguchi. All rights reserved.
//

#import "ViewController.h"
#import "StationManager.h"
#import "StationsTableViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *stations;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showStations"]) {
        StationsTableViewController *nextVC = segue.destinationViewController;
        nextVC.stations = self.stations;
    }
}

- (IBAction)requestStations:(UIButton *)sender {
    [[StationManager sharedManager] requestNearestStations:^(NSArray *stations, NSError *error) {
        self.stations = stations;
        [self performSegueWithIdentifier:@"showStations" sender:self];
    }];
}


@end
