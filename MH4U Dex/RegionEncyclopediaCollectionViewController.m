//
//  RegionEncyclopediaCollectionViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "RegionEncyclopediaCollectionViewController.h"

#import <CoreData/CoreData.h>

#import "CoreDataController.h"

#import "RegionContainerViewController.h"

#import "Region.h"

#import "RegionEncyclopediaCollectionViewCell.h"

@interface RegionEncyclopediaCollectionViewController ()

@property (nonatomic, strong) NSArray *regions;

@end

@implementation RegionEncyclopediaCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Region Encyclopedia";
    
    
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Region entityName]];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RegionAttributes.id ascending:YES]];
    self.regions = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching region data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.regions.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RegionEncyclopediaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RegionEncyclopediaCollectionViewCell class]) forIndexPath:indexPath];
    [cell displayContentsWithRegion:[self regionAtIndexPath:indexPath]];
    return cell;
}

#pragma mark - Helper Methods

- (Region *)regionAtIndexPath:(NSIndexPath *)indexPath
{
    return self.regions[indexPath.row];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRegionDetails"]) {
        RegionContainerViewController *regionVC = (RegionContainerViewController *)segue.destinationViewController;
        regionVC.managedObjectContext = self.managedObjectContext;
        
        if ([sender isMemberOfClass:[RegionEncyclopediaCollectionViewCell class]]) {
            RegionEncyclopediaCollectionViewCell *cell = (RegionEncyclopediaCollectionViewCell *)sender;
            Region *region = [self regionAtIndexPath:[self.collectionView indexPathForCell:cell]];
            regionVC.regionName = region.name;
            regionVC.regionKeyName = region.keyName;
            regionVC.region = region;
        }
    }
}

@end
