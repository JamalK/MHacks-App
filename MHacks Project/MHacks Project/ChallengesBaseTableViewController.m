//
//  ChallengesBaseTableViewController.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "ChallengesBaseTableViewController.h"
#import "ChallengeCell.h"
#import "LocationDelegate.h"

@interface ChallengesBaseTableViewController ()

@end

@implementation ChallengesBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)configureCell:(ChallengeCell *)cell WithChallenge:(Challenge *)challenge {
    cell.mainLabel.text = challenge.title ;
    cell.detailLabel.text = challenge.detailLabel ;
    [cell setLimitLabelWith:challenge.volunteers limit:challenge.limit];
    cell.logoView.file = challenge.organizer.logo ;
    CLLocationDistance distance = [[[CLLocation alloc] initWithLatitude:challenge.location.latitude longitude:challenge.location.longitude] distanceFromLocation:[LocationDelegate sharedManager].currentLocation];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%.2f km",distance/1000];
    [cell.logoView loadInBackground];
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
