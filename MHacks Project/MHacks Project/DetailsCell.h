//
//  DetailsCell.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *attendeesLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeandLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end
