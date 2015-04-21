//
//  MonsterQuestsTableViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/14/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Monster;
@class Region;

@interface MonsterQuestsTableViewController : UITableViewController

@property (nonatomic, strong) Monster *monster;
@property (nonatomic, strong) Region *region;
@property (nonatomic, assign) BOOL isMonsterLink;

@end
