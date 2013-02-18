//
//  OTLViewController.h
//  Location
//
//  Created by Othmane Laousy on 2/17/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface OTLViewController : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
