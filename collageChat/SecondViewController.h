//
//  SecondViewController.h
//  collageChat
//
//  Created by Ryan Chan on 7/26/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UILabel *movieLabel1;

@property (strong, nonatomic) IBOutlet UILabel *movieLabel2;

@property (strong, nonatomic) IBOutlet UITextView *movieSynopsis1;

@property (strong, nonatomic) IBOutlet UITextView *movieSynopsis2;

@property (strong, nonatomic) IBOutlet UIImageView *movieImage1;
@property (strong, nonatomic) IBOutlet UIImageView *movieImage2;


@property (strong,nonatomic)     NSURLConnection *firstConnection;

@property (strong,nonatomic)     NSURLConnection *musicConnection;

@end
