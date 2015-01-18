//
//  MapCell.h
//  
//
//  Created by Jamal E. Kharrat on 1/17/15.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapCell : UITableViewCell
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
