//
//  ItemSourceTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemSourceTableViewCell.h"

#import "Area.h"
#import "AreaDrop.h"
#import "Monster.h"
#import "MonsterDrop.h"

@interface ItemSourceTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *methodLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@end

@implementation ItemSourceTableViewCell

- (void)displayContentsWithDrop:(Drop *)drop
{
    if ([drop isKindOfClass:[MonsterDrop class]]) {
        MonsterDrop *monsterDrop = (MonsterDrop *)drop;
        self.methodLabel.text = monsterDrop.method;
        self.sourceLabel.text = monsterDrop.monsterSource.name;
    } else if ([drop isKindOfClass:[AreaDrop class]]) {
        AreaDrop *areaDrop = (AreaDrop *)drop;
        self.methodLabel.text = areaDrop.method;
        self.sourceLabel.text = areaDrop.area.name;
    }
}

@end
