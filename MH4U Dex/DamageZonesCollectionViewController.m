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

typedef NS_ENUM(NSInteger, DamageZoneSections) {
    DamageZoneLegendSection = 0,
    DamageZoneListSection = 1,
    
    DamageZoneSectionCount
};

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
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", DamageZoneAttributes.monsterName, self.monster.name];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:DamageZoneAttributes.id ascending:YES]];
    self.damageZones = [[CoreDataController sharedCDController].managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return DamageZoneSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case DamageZoneLegendSection:
            return 1;
        default:
            return self.damageZones.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DamageZoneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DamageZoneCell class]) forIndexPath:indexPath];
    DamageZone *damageZone;
    if (self.damageZones.firstObject) {
        //TODO: Remove once guaranteed that every monster has at least one damage zone.
        damageZone = (DamageZone *)self.damageZones[indexPath.row];
    }
    switch (indexPath.section) {
        case DamageZoneLegendSection:
            // Don't do anything for the first cell.
            break;
        default:
            // Change the cell's label
            [cell displayContentsWithDamageZone:damageZone];
    }
    return cell;
}

@end
