//
//  LoginFieldViewController.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Volunteriffy-swift.h"

@interface LoginFieldViewController : UIViewController


@property (weak, nonatomic) IBOutlet JKCustomTextField *usernameField;
@property (weak, nonatomic) IBOutlet JKCustomTextField *passwordField;
- (IBAction)loginButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
