//
//  ContactPerson.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface ContactPerson : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *name ;
@property (nonatomic, strong) NSString *phoneNumber ;
@property (nonatomic, strong) NSString *email ;



@end
