//
//  DamageZonesCollectionViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "DamageZonesCollectionViewController.h"

#import <CoreData/CoreData.h>

#import "DamageZoneCell.h"
#import "DamageZone.h"
//
//typedef NS_ENUM(NSUInteger, SectionConstants) {
//    foo = 0,
//    bar
//};

@interface DamageZonesCollectionViewController ()

@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *damageZones;

@end

@implementation DamageZonesCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.collectionView.bounds), 40.0f);
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[DamageZone entityName]];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"monsterName", self.monsterName];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    self.damageZones = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        default:
            return self.damageZones.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DamageZoneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DamageZoneCell class]) forIndexPath:indexPath];
    DamageZone *damageZone = (DamageZone *)self.damageZones[indexPath.row];
    switch (indexPath.section) {
        case 0:
            // Don't do anything for the first cell.
            break;
        default:
            // Change the cell's label
            [cell displayContentsWithDamageZone:damageZone];
    }
    return cell;
}

@end
