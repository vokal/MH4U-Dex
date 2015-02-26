//
//  ItemMonsterSourceTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemMonsterSourceTableViewCell.h"

@interface ItemMonsterSourceTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *methodLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@end

@implementation ItemMonsterSourceTableViewCell

- (void)displayContents
{
    self.methodLabel.text = self.method;
    self.sourceLabel.text = self.sourceName;
}

@end
