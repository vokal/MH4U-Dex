//
//  MonsterEncyclopediaHeader.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/25/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterEncyclopediaHeader.h"

@interface MonsterEncyclopediaHeader ()

@property (nonatomic, weak) IBOutlet UILabel *headerLabel;

@end

@implementation MonsterEncyclopediaHeader

- (void)configureHeaderLabelWithMonsterIsSmall:(BOOL)isSmall
{
    if (isSmall) {
        self.headerLabel.text = @"Small Monsters";
    } else {
        self.headerLabel.text = @"Large Monsters";
    }
}

@end
