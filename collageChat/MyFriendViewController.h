//
//  MyFriendViewController.h
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>

@interface MyFriendViewController : UIViewController<MKMapViewDelegate, MKAnnotation>
@property (strong, nonatomic) IBOutlet UILabel *nameMyFriend;
@property (strong, nonatomic) IBOutlet UILabel *ageMyFriend;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
