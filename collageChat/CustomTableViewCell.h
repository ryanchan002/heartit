//
//  CustomTableViewCell.h
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *buttonHeart;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewForTable;
@property (strong, nonatomic) IBOutlet UILabel *heartThisLabel;

@property BOOL heartButtonPressed;

@end
