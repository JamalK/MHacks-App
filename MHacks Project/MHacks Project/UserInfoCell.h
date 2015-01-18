//
//  UserInfoCell.h
//  
//
//  Created by Jamal E. Kharrat on 1/17/15.
//
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

@interface UserInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;

@end
