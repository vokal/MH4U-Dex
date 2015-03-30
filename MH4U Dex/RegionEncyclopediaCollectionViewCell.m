//
//  RegionEncyclopediaCollectionViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "RegionEncyclopediaCollectionViewCell.h"

#import "Region.h"

@interface RegionEncyclopediaCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *regionNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *regionIconImageView;

@end

@implementation RegionEncyclopediaCollectionViewCell

- (void)displayContentsWithRegion:(Region *)region
{
    NSString *imageName = [NSString stringWithFormat:@"%@-icon", region.keyName];
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        self.regionIconImageView.image = image;
    } else {
        self.regionIconImageView.image = nil;
    }
    self.regionNameLabel.text = region.name;
    self.regionNameLabel.textAlignment = NSTextAlignmentCenter;
}

@end
