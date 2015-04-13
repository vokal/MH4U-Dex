//
//  QuestRewardTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/13/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestRewardTableViewCell.h"

#import "Item.h"
#import "QuestDrop.h"

@interface QuestRewardTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *itemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *quantityLabel;
@property (nonatomic, weak) IBOutlet UILabel *percentLabel;

@end

@implementation QuestRewardTableViewCell

- (void)configureCellForQuestDrop:(QuestDrop *)drop
{
    self.itemNameLabel.text = drop.item.name;
    self.quantityLabel.text = [NSString stringWithFormat:@"#: %@", drop.quantity];
    self.percentLabel.text = [NSString stringWithFormat:@"%@%%", drop.percent];
}

@end
