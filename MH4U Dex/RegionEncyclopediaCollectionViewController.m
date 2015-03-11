//
//  RegionEncyclopediaCollectionViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "RegionEncyclopediaCollectionViewController.h"

#import "RegionEncylcopediaCollectionViewCell.h"

#import <CoreData/CoreData.h>

#import "CoreDataController.h"

#import "RegionContainerViewController.h"
#import "Region.h"

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
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
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
    RegionEncylcopediaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RegionEncylcopediaCollectionViewCell class]) forIndexPath:indexPath];
    
    // Configure the cell
    Region *region = self.regions[indexPath.row];
    cell.regionName = region.name;
    cell.regionKeyName = region.keyName;
    [cell displayContents];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRegionDetails"]) {
        RegionContainerViewController *regionVC = (RegionContainerViewController *)segue.destinationViewController;
        regionVC.managedObjectContext = self.managedObjectContext;
        regionVC.regionName = [sender regionName];
        regionVC.regionKeyName = [sender regionKeyName];
        
        CoreDataController *coreDataController = [CoreDataController sharedCDController];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", [sender regionName]];
        regionVC.region = (Region *)[coreDataController getUniqueEntityWithEntityName:[Region entityName] withPredicate:predicate];
    }
}

@end
