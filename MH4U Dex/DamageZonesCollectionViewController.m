//
//  DamageZonesCollectionViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "DamageZonesCollectionViewController.h"

#import <CoreData/CoreData.h>

#import "CoreDataController.h"

#import "DamageZone.h"
#import "Monster.h"

#import "DamageZoneCell.h"

static const NSUInteger NumberOfCategories = 10;

@interface DamageZonesCollectionViewController ()

@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *damageZones;

@end

@implementation DamageZonesCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.damageZones = [self.monster.damageZone sortedArrayUsingDescriptors:@[[NSSortDescriptor
                                                                               sortDescriptorWithKey:DamageZoneAttributes.id
                                                                               ascending:YES]]];
}

- (void)viewWillLayoutSubviews
{
    CGFloat cellSize = CGRectGetWidth(self.collectionView.bounds);
    cellSize -= self.flowLayout.minimumInteritemSpacing*4;
    cellSize -= (self.flowLayout.sectionInset.left + self.flowLayout.sectionInset.right);
    cellSize /= 5;
    self.flowLayout.itemSize = CGSizeMake(cellSize, cellSize);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (self.damageZones.count + 1) * NumberOfCategories;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DamageZoneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DamageZoneCell class]) forIndexPath:indexPath];
    DamageZone *damageZone;
    if (indexPath.row < NumberOfCategories) {
        [cell displayHeaderContentsAtIndexPath:indexPath];
        return cell;
    }
    //Since we return, no need for an else block
    
    if (self.damageZones.firstObject) {
        //TODO: Remove once guaranteed that every monster has at least one damage zone.
        damageZone = (DamageZone *)self.damageZones[indexPath.row/NumberOfCategories - 1];
    }
    NSUInteger category = indexPath.row % NumberOfCategories;
    
    [cell displayContentsWithDamageZone:damageZone atCategory:category];
    return cell;
}

@end
