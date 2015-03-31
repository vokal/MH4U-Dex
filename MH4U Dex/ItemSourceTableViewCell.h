//
//  ItemSourceTableViewCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Drop;

@interface ItemSourceTableViewCell : UITableViewCell

/**
 Update the cell's labels.
 */
- (void)displayContentsWithDrop:(Drop *)drop;

@end
