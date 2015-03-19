//
//  ItemAreaSourceTableViewCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AreaDrop;

@interface ItemAreaSourceTableViewCell : UITableViewCell

/**
 Update the cell's labels.
 */
- (void)displayContentsWithAreaDrop:(AreaDrop *)drop;

@end
