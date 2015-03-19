//
//  MonsterEncyclopediaCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Monster;

@interface MonsterEncyclopediaCell : UICollectionViewCell

/**
 Update the cell's labels.
 */
- (void)displayContentsWithMonster:(Monster *)monster;

@end
