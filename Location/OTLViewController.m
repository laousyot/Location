//
//  OTLViewController.m
//  Location
//
//  Created by Othmane Laousy on 2/17/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import "OTLViewController.h"

@interface OTLViewController ()
@end

@implementation OTLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy= kCLLocationAccuracyHundredMeters;
    self.locationManager.distanceFilter= 1000.0f;
    [self.locationManager startUpdatingLocation];
    if(![CLLocationManager locationServicesEnabled]){
        NSString *msg = @"Application cannot obtain location. Please go to Settings> Privacy> Location and enable location for this application";
        UIAlertView *alert;
        alert = [[UIAlertView alloc]
                 initWithTitle:@"Error"
                 message:msg
                 delegate:self
                 cancelButtonTitle:@"OK"
                 otherButtonTitles:nil];
        [alert show];
    }
   
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *msg = @"Error updating location";
    UIAlertView *alert;
    alert = [[UIAlertView alloc]
             initWithTitle:@"Error"
             message:msg
             delegate:self
             cancelButtonTitle:@"OK"
             otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSLog(@"lat: %f, lon:%f", location.coordinate.latitude, location.coordinate.longitude);
    [self addPinToMapAtLocation:location];
}

- (void)addPinToMapAtLocation:(CLLocation *)location
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location.coordinate;
    [self.mapView addAnnotation:pin];
    [self.mapView setCenterCoordinate:pin.coordinate];
    MKCoordinateSpan span;
    span.latitudeDelta=0.03;
    span.longitudeDelta=0.03;
    MKCoordinateRegion region;
    region.center=pin.coordinate;
    region.span= span;
    [_mapView setRegion:region animated:TRUE];
    
}

@end
