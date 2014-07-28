//
//  SendPostCardViewController.m
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import "SendPostCardViewController.h"

@interface SendPostCardViewController ()


@end

@implementation SendPostCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)sendPhysicalPostCard:(id)sender {
    
    SYSincerelyController *controller = [[SYSincerelyController alloc] initWithImages:[NSArray arrayWithObject:[UIImage imageNamed:@"demo_image.jpg"]]
                                                                              product:SYProductTypePostcard
                                                                       applicationKey:@"V8YPR1L09ZA9Y7ZGU4WZN5REJ2NP5BPBRJYIQY2N"
                                                                             delegate:self];
    
    NSDictionary *address1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Rick Harrison", @"name",
                              @"800 Market St. Floor 6", @"street1",
                              @"94102", @"zipcode", nil];
    
    controller.recipients = [NSArray arrayWithObjects:address1, nil];
    
    controller.shouldSkipCrop= YES;
    controller.message = @"I made you a Collage, heart what you like!";
    controller.profilePhoto = [UIImage imageNamed:@"us_girl_student_profile.png"];
    
    if (controller) {
        [self presentViewController:controller animated:YES completion:NULL];
    }
    

}


- (IBAction)sendECard:(id)sender {
    
    // Email Subject
    NSString *emailTitle = @"I made you a Collage, heart what you like!";
    // Email Content
    NSString *messageBody = @"Here's a collage I made you!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"kamilah@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    
    UIImage *myImage = [UIImage imageNamed:@"us_postcard1.jpg"];
    NSData *imageData = UIImagePNGRepresentation(myImage);
    [mc addAttachmentData:imageData mimeType:@"image/png" fileName:@"postImage"];
    
    
     myImage = [UIImage imageNamed:@"postcard_back.jpg"];
    imageData = UIImagePNGRepresentation(myImage);
    [mc addAttachmentData:imageData mimeType:@"image/png" fileName:@"backImage"];
    
    
    
    
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImage *image = [UIImage imageNamed:@"nav_bar.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.navigationController.navigationBar.topItem setTitleView:imageView];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
