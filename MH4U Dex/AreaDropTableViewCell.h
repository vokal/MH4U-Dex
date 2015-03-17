//
//  AreaDropTableViewCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/11/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AreaDrop;

@interface AreaDropTableViewCell : UITableViewCell

/**
 Update the cell's labels with information based on the AreaDrop object passed in.
 */
- (void)displayContentsWithAreaDrop:(AreaDrop *)areaDrop;

@end
