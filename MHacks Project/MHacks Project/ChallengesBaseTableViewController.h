//
//  ChallengesBaseTableViewController.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Challenge.h"

@interface ChallengesBaseTableViewController : UITableViewController


- (void)configureCell:(UITableViewCell *)cell WithChallenge:(Challenge *)challenge ;



@end
