//
//  LoginViewController.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@implementation LoginViewController


-(void)viewDidLoad {

}

-(void)viewDidAppear:(BOOL)animated {
    if ([User currentUser]) {
        UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"tab"];
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

- (IBAction)loginButtonTapped:(id)sender {
    
}
- (IBAction)signupButtonTapped:(id)sender {
    
}

@end
