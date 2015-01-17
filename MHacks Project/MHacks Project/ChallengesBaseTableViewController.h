//
//  ChallengesBaseTableViewController.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Challenge.h"
#import <ParseUI/ParseUI.h>
#import "ChallengeCell.h"

@interface ChallengesBaseTableViewController : PFQueryTableViewController


- (void)configureCell:(ChallengeCell *)cell WithChallenge:(Challenge *)challenge ;



@end
