//
//  MeViewController.m
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *firstButton;
@property (strong, nonatomic) IBOutlet UIButton *secondButton;
@property (strong, nonatomic) IBOutlet UIButton *thirdButton;
@property (strong, nonatomic) IBOutlet UIImageView *myPictureVIew;

@end

@implementation MeViewController

BOOL firstPicked = NO;
BOOL secondPicked = NO;
BOOL thirdPicked = NO;

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}


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
    // Do any additional setup after loading the view.
    self.myPictureVIew.layer.masksToBounds = YES;
    self.myPictureVIew.layer.cornerRadius = 40;
}
- (IBAction)physicalPostCard:(id)sender {

        
        SYSincerelyController *controller = [[SYSincerelyController alloc] initWithImages:[NSArray arrayWithObject:[UIImage imageNamed:@"us_postcard2.jpg"]]
            
                                                                                  product:SYProductTypePostcard
                                                                           applicationKey:@"V8YPR1L09ZA9Y7ZGU4WZN5REJ2NP5BPBRJYIQY2N"
                                                                                 delegate:self];
        
        NSDictionary *address1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Rick Harrison", @"name",
                                  @"800 Market St. Floor 6", @"street1",
                                  @"94102", @"zipcode", nil];
        
        controller.recipients = [NSArray arrayWithObjects:address1, nil];
        
        controller.shouldSkipCrop= YES;
        controller.message = @"I just sent you a collage!";
        controller.profilePhoto = [UIImage imageNamed:@"us_girl_student_profile.png"];
        
        if (controller) {
            [self presentViewController:controller animated:YES completion:NULL];
        }
        
        
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)firstButtonPressed:(id)sender {
    firstPicked = YES;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)secondButtonPressed:(id)sender {
    secondPicked = YES;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)thirdButtonPressed:(id)sender {
    thirdPicked = YES;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}




-(void)actionLaunchAppCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = YES;
        
        [self presentModalViewController:imagePicker animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Camera Unavailable"
                                                       message:@"Unable to find a camera on your device."
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
        alert = nil;
    }
    
}





-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    if(firstPicked) {
        self.firstImageView.image   = chosenImage;
        self.firstButton.titleLabel.text = @"";
        self.firstButton.imageView.image = nil;
        firstPicked = NO;
    }
    
    else if(secondPicked) {
        self.secondImageView.image   = chosenImage;
        self.secondButton.titleLabel.text = @"";
        self.secondButton.imageView.image = nil;
        secondPicked = NO;
    }
    
    else if(thirdPicked) {
        self.thirdImageView.image   = chosenImage;
        self.thirdButton.imageView.image = nil;
        self.thirdButton.titleLabel.text = @"";
        thirdPicked = NO;
    }


    
    [self dismissModalViewControllerAnimated:YES];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
}




- (void)sincerelyControllerDidFinish:(SYSincerelyController *)controller {
    /*
     * Here I know that the user made a purchase and I can do something with it
     */
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)sincerelyControllerDidCancel:(SYSincerelyController *)controller {
    /*
     * Here I know that the user hit the cancel button and they want to leave the Sincerely controller
     */
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)sincerelyControllerDidFailInitiationWithError:(NSError *)error {
    /*
     * Here I know that incorrect inputs were given to initWithImages:product:applicationKey:delegate;
     */
    
    NSLog(@"Error: %@", error);
}





- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (IBAction)sendECard:(id)sender {
    
    // Email Subject
    NSString *emailTitle = @"I made you a Collage!";
    // Email Content
    NSString *messageBody = @"Here's a collage I made you, heart what you like!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"gaby@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    
    UIImage *myImage = [UIImage imageNamed:@"us_postcard1.jpg"];
    NSData *imageData = UIImagePNGRepresentation(myImage);
    [mc addAttachmentData:imageData mimeType:@"image/png" fileName:@"orangeImage"];
    
    
    myImage = [UIImage imageNamed:@"postcard_back.jpg"];
    imageData = UIImagePNGRepresentation(myImage);
    [mc addAttachmentData:imageData mimeType:@"image/png" fileName:@"orangeImage"];
    
    
    
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
    
}





@end
