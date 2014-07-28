//
//  MeViewController.h
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShipLib/ShipLib.h>
#import <MessageUI/MessageUI.h>

@interface MeViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate, SYSincerelyControllerDelegate,MFMailComposeViewControllerDelegate>

- (IBAction)firstButtonPressed:(id)sender;
- (IBAction)secondButtonPressed:(id)sender;
- (IBAction)thirdButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *thirdImageView;
@property (strong, nonatomic) IBOutlet UIImageView *secondImageView;
@property (strong, nonatomic) IBOutlet UIImageView *firstImageView;

@end
