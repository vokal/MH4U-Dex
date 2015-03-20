//
//  MonsterItemTableViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

@class Monster;

#import <UIKit/UIKit.h>

@interface MonsterItemTableViewController : UITableViewController

@property (nonatomic, strong) Monster *monster;
@property (nonatomic, strong) NSString *rank;

@end
