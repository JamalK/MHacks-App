//
//  LocationDelegate.h
//  Doorman
//
//  Created by Jamal E. Kharrat on 11/30/14.
//  Copyright (c) 2014 Jamal E. Kharrat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol CurrentLocationDelegate <NSObject>

- (void)didFindLocation:(CLLocation*)location ;

@optional
- (void)didEncounterErrorInFindingLocation:(NSError*)error ;

@end

@interface LocationDelegate : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocation        *currentLocation ;

@property id      <CurrentLocationDelegate>     currentLcationDelegate ;

+ (instancetype)sharedManager ;
- (void)startUpdating ;
- (void)stopUpdating  ;


- (void)updateLocation;

@end
