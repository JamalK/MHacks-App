//
//  ChallengesBaseTableViewController.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "ChallengesBaseTableViewController.h"
#import "ChallengeCell.h"

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
    cell.detailLabel.text = challenge.details ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
