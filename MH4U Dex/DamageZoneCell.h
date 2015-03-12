//
//  DamageZoneCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DamageZone.h"

@interface DamageZoneCell : UICollectionViewCell

- (void)displayContentsWithDamageZone:(DamageZone *)damageZone;

@end
