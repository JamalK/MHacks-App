//
//  Challenge.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "ContactPerson.h"


@interface Challenge : NSObject

@property (nonatomic, strong) NSString      *title     ;
@property (nonatomic, strong) NSNumber      *limit     ;
@property (nonatomic, strong) NSString      *details   ;
@property (nonatomic, strong) CLLocation    *location  ;
@property (nonatomic, strong) NSDate        *date      ;
@property (nonatomic, strong) ContactPerson *leader    ;
@property (nonatomic, assign) BOOL          completed  ;
@property (nonatomic, assign) NSInteger     points     ;






@end
