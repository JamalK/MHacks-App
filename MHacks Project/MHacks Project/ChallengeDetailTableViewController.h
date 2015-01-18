//
//  ChallengeDetailTableViewController.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Challenge.h"


@interface ChallengeDetailTableViewController : UITableViewController


-(instancetype)initWithChallenge:(Challenge *)challenge ;

@property (strong, nonatomic) Challenge *challenge ;
@property (weak, nonatomic) UIBarButtonItem *subscribeButtonTapped;




@end
