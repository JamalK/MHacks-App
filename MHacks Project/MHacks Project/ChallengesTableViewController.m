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
#import <GameKit/GameKit.h>
#import "Constants.h"
#import "ChallengeDetailTableViewController.h"

@implementation ChallengesTableViewController  {
    BOOL gameCenterEnabled ;
}


-(void)authenticateLocalPlayer {
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                gameCenterEnabled = YES;
                
                // Get the default leaderboard identifier.
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else{
                        leaderboardIdentifier = leaderboardIdentifier;
                    }
                }];
            }
            
            else{
                gameCenterEnabled = NO;
            }
        }
    };
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self authenticateLocalPlayer];
    LocationDelegate *newDelegate = [LocationDelegate sharedManager];
    [newDelegate startUpdating];
    newDelegate.currentLcationDelegate = self ;
    [self.tableView registerNib:[UINib nibWithNibName:@"ChallengeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ChallengeCellIdentifier];
    

    
}

-(void)viewDidAppear:(BOOL)animated {

}

-(void)didFindLocation:(CLLocation *)location {
    NSLog(@"%.3f %.2f",location.coordinate.longitude,location.coordinate.latitude);
    self.currentLocation = location ;
    
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
    [query includeKey:@"organizer"];
    PFGeoPoint *point = [[PFGeoPoint alloc]init];
    point.latitude = [LocationDelegate sharedManager].currentLocation.coordinate.latitude ;
    point.longitude = [LocationDelegate sharedManager].currentLocation.coordinate.longitude ;
    
    [query whereKey:@"location" nearGeoPoint:point];
    
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
    ChallengeDetailTableViewController *cdtbc = [[ChallengeDetailTableViewController alloc]initWithChallenge:self.objects[indexPath.row]];
    [self.navigationController pushViewController:cdtbc animated:YES];
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
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
