//
//  ChallengeCell.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChallengeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end
