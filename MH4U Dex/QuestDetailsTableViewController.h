//
//  QuestDetailsTableViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/13/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quest;

@interface QuestDetailsTableViewController : UITableViewController

@property (nonatomic, strong) Quest *quest;

@end
