//
//  DamageZoneCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DamageZone;

@interface DamageZoneCell : UICollectionViewCell

/**
 Update the cell's labels with information based on the DamageZone object passed in.
 */
- (void)displayContentsWithDamageZone:(DamageZone *)damageZone atCategory:(NSUInteger)category;

/**
 Update the cell's labels with predefined information, to act as a legend/header.
 */
- (void)displayHeaderContentsAtIndexPath:(NSIndexPath *)indexPath;

@end
