//
//  QuestRewardsTableViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/13/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@class Quest;

@interface QuestRewardsTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) Quest *quest;

@end
