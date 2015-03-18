//
//  DropTableViewCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MonsterDrop;

@interface DropTableViewCell : UITableViewCell

/**
 Update the cell's labels.
 */
- (void)displayContentsOfMonsterDrop:(MonsterDrop *)drop;

@end
