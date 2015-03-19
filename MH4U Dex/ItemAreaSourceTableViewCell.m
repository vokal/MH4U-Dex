//
//  ItemAreaSourceTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemAreaSourceTableViewCell.h"

#import "Area.h"
#import "AreaDrop.h"

@interface ItemAreaSourceTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *methodLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@end

@implementation ItemAreaSourceTableViewCell

- (void)displayContentsWithAreaDrop:(AreaDrop *)drop
{
    self.methodLabel.text = drop.method;
    self.sourceLabel.text = drop.area.name;
}

@end
