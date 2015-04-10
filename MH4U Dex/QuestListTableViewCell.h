//
//  QuestListTableViewCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/17/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quest;

@interface QuestListTableViewCell : UITableViewCell

/**
 Update the cell's labels.
 */
- (void)displayContentsWithQuest:(Quest *)quest;

@end
