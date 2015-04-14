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
#import "Region.h"
#import "Quest.h"
#import "QuestDrop.h"

@interface ItemSourceTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *methodLabel;
@property (nonatomic, weak) IBOutlet UILabel *sourceLabel;
@property (nonatomic, weak) IBOutlet UILabel *quantityLabel;
@property (nonatomic, weak) IBOutlet UILabel *percentLabel;

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
        self.methodLabel.text = [NSString stringWithFormat:@"%@ %@", areaDrop.area.name, areaDrop.method];
        self.sourceLabel.text = areaDrop.area.region.name;
    } else if ([drop isKindOfClass:[QuestDrop class]]) {
        QuestDrop *questDrop = (QuestDrop *)drop;
        self.methodLabel.text = [NSString stringWithFormat:@"%@ Row", questDrop.row];
        self.sourceLabel.text = questDrop.quest.name;
    }
    self.quantityLabel.text = [NSString stringWithFormat:@"#: %@", drop.quantity];
    self.percentLabel.text = [NSString stringWithFormat:@"%@%%", drop.percent];
}

@end
