//
//  Challenge.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/16/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "Challenge.h"
#import <DateTools.h>
@implementation Challenge

@dynamic title,leader,location,date,completed, worth, limit,  details,organizer,volunteers ;

+ (NSString *)parseClassName {
    return @"Challenge" ;
}


- (NSString *)detailLabel {
    return [NSString stringWithFormat:@"%@",self.date.timeAgoSinceNow];
}

@end
