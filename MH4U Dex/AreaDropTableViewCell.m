//
//  AreaDropTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/11/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "AreaDropTableViewCell.h"

#import "AreaDrop.h"
#import "Item.h"

@interface AreaDropTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *methodLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;

@end

@implementation AreaDropTableViewCell

- (void)displayContentsWithAreaDrop:(AreaDrop *)areaDrop
{
    self.itemNameLabel.text = areaDrop.item.name;
    self.methodLabel.text = areaDrop.method;
    self.quantityLabel.text = [NSString stringWithFormat:@"#: %@", areaDrop.quantity];
    self.percentLabel.text = [NSString stringWithFormat:@"%@%%", areaDrop.percent];
}

@end
