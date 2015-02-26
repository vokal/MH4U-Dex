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

@interface DamageZonesCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *damageZones;

@end

@implementation DamageZonesCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.collectionView.bounds), 40.0f);
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"DamageZone"];
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
    if (section == 0) {
        return 1;
    } else {
        return self.damageZones.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DamageZoneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DamageZoneCell class]) forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.bodyPart = @"Body Part";
        cell.extract = @"Extract";
        cell.cut = -1;
        cell.impact = -1;
        cell.shot = -1;
        cell.ko = -1;
        cell.fire = -1;
        cell.ice = -1;
        cell.thunder = -1;
        cell.water = -1;
        cell.dragon = -1;
        [cell displayContents];
    } else {
        // Change the cell's label
        DamageZone *damageZone = (DamageZone *)self.damageZones[indexPath.row];
        cell.bodyPart = damageZone.bodyPart;
        cell.cut = damageZone.cutValue;
        cell.impact = damageZone.impactValue;
        cell.shot = damageZone.shotValue;
        cell.ko = damageZone.koValue;
        cell.extract = damageZone.extract;
        cell.fire = damageZone.fireValue;
        cell.ice = damageZone.iceValue;
        cell.thunder = damageZone.thunderValue;
        cell.water = damageZone.waterValue;
        cell.dragon = damageZone.dragonValue;
        [cell displayContents];
    }
    
    return cell;
}

@end
