//
//  User.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <Parse/Parse.h>

@interface User : PFUser <PFSubclassing>

@property (nonatomic, strong) NSNumber *points ;
@property (nonatomic, strong) NSString *name ;
@property (nonatomic, strong) PFFile   *avatar ;



@end
