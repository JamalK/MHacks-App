//
//  LoginFieldViewController.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "LoginFieldViewController.h"
#import <Parse/Parse.h>
#import "User.h"

@implementation LoginFieldViewController 


-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)loginButtonTapped:(id)sender {
    [User logInWithUsernameInBackground:_usernameField.text password:_passwordField.text block:^(PFUser *user, NSError *error) {
        if (!error) {
            [self performSegueWithIdentifier:@"login" sender:self];
        }
    }];
    
}
@end
