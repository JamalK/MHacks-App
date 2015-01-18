//
//  CLLocation+CLLLocation_Address.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "CLLocation+CLLLocation_Address.h"

@implementation CLLocation (CLLLocation_Address)

-(void)address:(void (^)(NSString *result))block{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.coordinate.latitude, self.coordinate.longitude);
    CLLocation *location = [[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             NSString *address = [[NSString alloc]initWithString:locatedAt];
//             NSString *Area = [[NSString alloc]initWithString:placemark.locality];
//             NSString *Country = [[NSString alloc]initWithString:placemark.country];
//             NSString *CountryArea = [NSString stringWithFormat:@"%@, %@", Area,Country];
             block(address);
             
         }
         else
         {
             block(@"Null");
         }
         
     }];

}

@end
