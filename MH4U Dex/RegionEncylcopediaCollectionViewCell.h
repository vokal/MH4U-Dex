//
//  RegionEncylcopediaCollectionViewCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegionEncylcopediaCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *regionName;
@property (nonatomic, strong) NSString *regionKeyName;

/**
 Update the cell's labels.
 */
- (void)displayContents;

@end
