//
//  ChallengeDetailTableViewController.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "ChallengeDetailTableViewController.h"
#import "Constants.h"
#import "MapCell.h"
#import "ContactCell.h"
#import "DetailsCell.h"
#import "CLLocation+CLLLocation_Address.h"
#import <MapKit/MapKit.h>
#import <GameKit/GameKit.h>
#import <DateTools.h>
@interface ChallengeDetailTableViewController () {
    UIBarButtonItem *flipButton ;
}

@end

@implementation ChallengeDetailTableViewController

-(instancetype)initWithChallenge:(Challenge *)challenge {
    self = [super init];
    if (self) {
        self.challenge = challenge ;
    }
    return self ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Participate"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(flipView)];
    flipButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = flipButton;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MapCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MapCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"ContactCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ContactCellIdentfier];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailsCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:DetailsCellIdentifer];
}


- (void)flipView {
    
    GKAchievement *levelAchievement = [[GKAchievement alloc]initWithIdentifier:@"ChallengeCompleted"];
    levelAchievement.percentComplete = 100 ;
    
    NSArray *achievements = @[levelAchievement];
    
    [GKAchievement reportAchievements:achievements withCompletionHandler:^(NSError *error) {
        if (!error) {
            GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"leaderboard7"];
            score.value = 10 ;
            
            [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
                if (error != nil) {
                    [[[UIAlertView alloc]initWithTitle:@"Success!" message:@"You just earned 10 points!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil]show ];
                    [self.navigationController popViewControllerAnimated:YES];
                    NSLog(@"%@", [error localizedDescription]);
                }
            }];
            
        }
        else {
            NSLog(@"error:%@",error.localizedDescription);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        DetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailsCellIdentifer];
        cell.titleLabel.text = _challenge.title ;
        cell.detailsLabel.text = _challenge.details ;
        cell.attendeesLabel.text = [NSString stringWithFormat:@"%@/%@",_challenge.volunteers,_challenge.limit];
        cell.timeandLocationLabel.text = [NSString stringWithFormat:@"%@",_challenge.date];
        
        CLLocation *location = [[CLLocation alloc]initWithLatitude:_challenge.location.latitude longitude:_challenge.location.longitude];
        
        [location address:^(NSString *result) {
            cell.addressLabel.text = result ;
        }];
        
        return cell ;
    }
    else if (indexPath.row == 1) {
        MapCell *mapCell = [tableView dequeueReusableCellWithIdentifier:MapCellIdentifier];
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.title = @"Location" ;
        annotation.coordinate = CLLocationCoordinate2DMake(_challenge.location.latitude, _challenge.location.longitude);
        [mapCell.mapView addAnnotation:annotation];
        [mapCell.mapView setRegion:MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpanMake(2, 2)) animated:YES];
        
        return mapCell ;
    }
    
    return nil ;
    
    // Configure the cell...
    
//    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 298 ;
    }
    return 168 ;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)participateTapped:(id)sender {
}
@end
