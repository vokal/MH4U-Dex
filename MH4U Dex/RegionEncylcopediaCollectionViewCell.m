//
//  RegionEncylcopediaCollectionViewCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "RegionEncylcopediaCollectionViewCell.h"

@interface RegionEncylcopediaCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *regionNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *regionIconImageView;

@end

@implementation RegionEncylcopediaCollectionViewCell

- (void)displayContents
{
    NSString *imageName = [NSString stringWithFormat:@"%@-icon", self.regionKeyName];
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        self.regionIconImageView.image = image;
    } else {
        self.regionIconImageView.image = nil;
    }
    self.regionNameLabel.text = self.regionName;
    [self.regionNameLabel sizeToFit];
}

@end
