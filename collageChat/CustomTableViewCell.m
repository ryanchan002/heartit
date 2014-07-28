//
//  CustomTableViewCell.m
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)heartButtonPressed:(id)sender {
    [self.buttonHeart setImage:[UIImage imageNamed:@"iconSmall.png"] forState:UIControlStateNormal];
    self.heartThisLabel.text = @"Hearted!";
    self.heartThisLabel.textColor = [UIColor redColor];
}




@end
