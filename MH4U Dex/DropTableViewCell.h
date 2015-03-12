//
//  DropTableViewCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *method;
@property (nonatomic, assign) NSInteger percent;
@property (nonatomic, assign) NSInteger quantity;

/**
 Update the cell's labels.
 */
- (void)displayContents;

@end
