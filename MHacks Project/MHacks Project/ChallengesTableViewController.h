//
//  ChallengesTableViewController.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengesBaseTableViewController.h"
#import "LocationDelegate.h"

@interface ChallengesTableViewController : ChallengesBaseTableViewController <CurrentLocationDelegate>

@property (strong, nonatomic) CLLocation *currentLocation ;
@property (strong, nonatomic) CLLocationManager *locationManager  ;

-(void)authenticateLocalPlayer;


@end
