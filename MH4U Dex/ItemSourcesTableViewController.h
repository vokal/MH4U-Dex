//
//  ItemSourcesTableViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemSourcesTableViewController : UITableViewController

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, assign) BOOL isMonsterSource;

@end
