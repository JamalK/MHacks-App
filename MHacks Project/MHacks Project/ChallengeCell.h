//
//  ChallengeCell.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

@interface ChallengeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *logoView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *limitLabel;


- (void)setLimitLabelWith:(NSNumber *)attendees limit:(NSNumber *)limit ;

@end
