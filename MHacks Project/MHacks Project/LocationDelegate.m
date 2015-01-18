//
//  LocationDelegate.m
//  Doorman
//
//  Created by Jamal E. Kharrat on 11/30/14.
//  Copyright (c) 2014 Jamal E. Kharrat. All rights reserved.
//

#import "LocationDelegate.h"
#import <UIKit/UIKit.h>



@interface LocationDelegate ()

@property (retain, nonatomic) CLLocationManager *locationManager ;

@end


@implementation LocationDelegate


+ (instancetype)sharedManager
{
    static id sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)startUpdating {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest ;
    self.locationManager.distanceFilter = kCLDistanceFilterNone ;
    
    if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }

    [_locationManager startUpdatingLocation];
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    NSLog(@"%u", status);
    
    
}



- (void)stopUpdating {
    [self.locationManager stopUpdatingLocation];
    self.locationManager = nil;
}

- (void)updateLocation {
    //Request authorization for Devices running iOS 8

}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"%u", status);
}


#pragma mark - CoreLocation Methods Current Location

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    _currentLocation = locations[0];
    
    [self.currentLcationDelegate didFindLocation:locations[0]];
    
    [manager startMonitoringForRegion:[[CLCircularRegion alloc] initWithCenter:_currentLocation.coordinate radius:10 identifier:[[NSUUID UUID]UUIDString]]];
    
    CLLocation *newLocation = [locations firstObject];
    NSLog(@"Did update to location with Longitude %.5f \t Latitude %.5f",
          newLocation.coordinate.longitude,newLocation.coordinate.latitude);
    
}

- (void)requestAlwaysAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    // If the status is denied or only granted for when in use, display an alert
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusDenied) {
        NSString *title;
        title = (status == kCLAuthorizationStatusDenied) ? @"Location services are off" : @"Background location is not enabled";
        NSString *message = @"To use background location you must turn on 'Always' in the Location Services Settings";
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Settings", nil];
        [alertView show];
    }
    // The user has not enabled any location services. Request background authorization.
    else if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
    }
}





- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}



@end
