//
//  MyFriendProfileViewController.m
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import "MyFriendProfileViewController.h"

@interface MyFriendProfileViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *likePicture;
@property (strong, nonatomic) IBOutlet UIImageView *countryPicture;
@property (strong, nonatomic) IBOutlet UIButton *schoolPicture;


@end

@implementation MyFriendProfileViewController

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
    self.likePicture.layer.masksToBounds = YES;
    self.countryPicture.layer.masksToBounds = YES;
    self.schoolPicture.layer.masksToBounds = YES;
    self.likePicture.layer.cornerRadius= 10;
    self.countryPicture.layer.cornerRadius = 10;
    self.schoolPicture.layer.cornerRadius = 10;
    
    
    [self.schoolPicture setImage:[UIImage imageNamed:@"haiti_school_icon_selected.jpg"] forState:UIControlStateSelected];
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

@end
