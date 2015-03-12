//
//  ItemAreaSourcesTableViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemAreaSourcesTableViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSString *itemName;

@end
