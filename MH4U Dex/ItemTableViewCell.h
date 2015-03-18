//
//  ItemTableViewCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface ItemTableViewCell : UITableViewCell

/**
 Update the cell's labels.
 */
- (void)displayContentsWithItem:(Item *)item;

@end
