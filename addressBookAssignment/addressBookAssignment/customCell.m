//
//  customCell.m
//  addressBookAssignment
//
//  Created by Jordan Weaver on 9/24/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "customCell.h"

@implementation customCell
@synthesize emailLabel, timeLabel;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
