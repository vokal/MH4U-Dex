//
//  DropTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "DropTableViewCell.h"

@interface DropTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;

@end

@implementation DropTableViewCell

- (void)displayContents
{
    self.itemNameLabel.text = self.itemName;
    self.sourceLabel.text = self.method;
    self.quantityLabel.text = [NSString stringWithFormat:@"#: %d", self.quantity];
    self.percentLabel.text = [NSString stringWithFormat:@"%d%%", self.percent];
}

@end
