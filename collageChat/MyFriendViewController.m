//
//  MyFriendViewController.m
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import "MyFriendViewController.h"
#import "MyAnnotation.h"

@interface MyFriendViewController ()
@property (strong,nonatomic)  MKPointAnnotation *annotate;
@property (strong, nonatomic) IBOutlet UIImageView *profilePicture;


@end

@implementation MyFriendViewController

CLPlacemark *startPlacemark;
CLLocation *currentLocationCoordinates;
CLPlacemark *aPlacemark;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.profilePicture.layer.masksToBounds=YES;
    self.profilePicture.layer.cornerRadius = 60;
    [self.mapView setDelegate:self];
    // Do any additional setup after loading the view.
    self.nameMyFriend.text = @"Gaby Miranda";
    self.ageMyFriend.text = @"7th Grade";
    
    [self dropPinOnLocation];
    
    
    
}



-(void) dropPinOnLocation {
    
    CLLocation *theLocation = [[CLLocation alloc] initWithLatitude:19.00 longitude:-72.20];

        
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = theLocation.coordinate.latitude;
    coordinate1.longitude = theLocation.coordinate.longitude;
    
    MyAnnotation *annotation = [[MyAnnotation alloc] initWithCoordinate:coordinate1 title:[NSString stringWithFormat:@"Haiti"]];
    
    [self.mapView addAnnotation:annotation];
        
        
    
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = theLocation.coordinate;
    mapRegion.span = MKCoordinateSpanMake(4, 4);
    [self.mapView setRegion:mapRegion animated: YES];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKAnnotationView *annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    if(annotationView)
        return annotationView;
    else
    {
        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                        reuseIdentifier:AnnotationIdentifier];
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"pin.png"];
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton addTarget:self action:@selector(writeSomething:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        //annotationView.rightCalloutAccessoryView = rightButton;
        annotationView.canShowCallout = YES;
        annotationView.draggable = YES;
        return annotationView;
    }
    return nil;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
