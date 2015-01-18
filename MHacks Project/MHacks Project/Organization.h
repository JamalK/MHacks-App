//
//  Organization.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Organization : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *name ;
@property (nonatomic, strong) PFFile   *logo ;
@property (nonatomic, strong) NSString *mission ;
@property (nonatomic, strong) NSString *address ;



@end
