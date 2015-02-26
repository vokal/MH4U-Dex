//
//  ItemTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemTableViewCell.h"

@interface ItemTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *itemNameLabel;

@end

@implementation ItemTableViewCell

- (void)displayContents
{
    self.itemNameLabel.text = self.itemName;
}

@end
