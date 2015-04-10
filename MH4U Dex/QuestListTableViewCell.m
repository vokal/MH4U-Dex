//
//  QuestListTableViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/17/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestListTableViewCell.h"

#import "Quest.h"

@interface QuestListTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *questNameLabel;

@end

@implementation QuestListTableViewCell

- (void)displayContentsWithQuest:(Quest *)quest
{
    self.questNameLabel.text = quest.name;
}

@end
