//
//  CLLocation+CLLLocation_Address.h
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (CLLLocation_Address)

-(void)address:(void (^)(NSString *result))block ;

@end
