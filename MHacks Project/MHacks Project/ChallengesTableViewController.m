//
//  ChallengesTableViewController.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "ChallengesTableViewController.h"
#import "ChallengeCell.h"
#import "Challenge.h"
#import "Constants.h"

@implementation ChallengesTableViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChallengeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ChallengeCellIdentifier];
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = YES;
        self.objectsPerPage = 8;
    }
    return self;
}

-(PFQuery *)queryForTable {
    PFQuery *query = [Challenge query];
    
    return query ;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Challenge *challengeAtIdx = self.objects[indexPath.row];
    ChallengeCell *cell = [tableView dequeueReusableCellWithIdentifier:ChallengeCellIdentifier];
    [super configureCell:cell WithChallenge:challengeAtIdx];
    return cell ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Did select");
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90 ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 ;
}


@end
