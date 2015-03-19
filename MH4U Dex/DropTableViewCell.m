//
//  DropTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "DropTableViewCell.h"

#import "Item.h"
#import "MonsterDrop.h"

@interface DropTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;

@end

@implementation DropTableViewCell

- (void)displayContentsOfMonsterDrop:(MonsterDrop *)drop
{
    self.itemNameLabel.text = drop.item.name;
    self.sourceLabel.text = drop.method;
    self.quantityLabel.text = [NSString stringWithFormat:@"#: %@", drop.quantity];
    self.percentLabel.text = [NSString stringWithFormat:@"%@%%", drop.percent];
}

@end
