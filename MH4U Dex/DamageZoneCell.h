//
//  DamageZoneCell.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DamageZoneCell : UICollectionViewCell

@property (nonatomic, strong) NSString *bodyPart;
@property (nonatomic, assign) NSInteger cut;
@property (nonatomic, assign) NSInteger impact;
@property (nonatomic, assign) NSInteger shot;
@property (nonatomic, assign) NSInteger ko;
@property (nonatomic, strong) NSString *extract;
@property (nonatomic, assign) NSInteger fire;
@property (nonatomic, assign) NSInteger water;
@property (nonatomic, assign) NSInteger thunder;
@property (nonatomic, assign) NSInteger ice;
@property (nonatomic, assign) NSInteger dragon;

- (void)displayContents;

@end
