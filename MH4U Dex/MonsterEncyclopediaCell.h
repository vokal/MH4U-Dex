//
//  MonsterEncyclopediaCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonsterEncyclopediaCell : UICollectionViewCell

@property (nonatomic, strong) NSString *monsterName;

- (void)displayContents;

@end
