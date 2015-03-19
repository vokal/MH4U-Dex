//
//  MonsterEncyclopediaCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterEncyclopediaCell.h"

#import "Monster.h"

@interface MonsterEncyclopediaCell ()

@property (nonatomic, weak) IBOutlet UILabel *monsterNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *monsterImageView;

@end

@implementation MonsterEncyclopediaCell

- (void)displayContentsWithMonster:(Monster *)monster
{
    NSString *imageName = [NSString stringWithFormat:@"%@-icon", [monster.name lowercaseString]];
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        self.monsterImageView.image = image;
    } else {
        self.monsterImageView.image = nil;
    }
    self.monsterNameLabel.text = monster.name;
}

@end
