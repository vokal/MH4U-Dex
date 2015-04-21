//
//  CombinationEncyclopediaCollectionViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/21/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "CombinationEncyclopediaCollectionViewController.h"

#import <CoreData/CoreData.h>

#import "CoreDataController.h"

#import "Combination.h"

@interface CombinationEncyclopediaCollectionViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation CombinationEncyclopediaCollectionViewController

static NSString *const reuseIdentifier = @"ComboCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fetchedResultsController = [self fetchedResultsControllerWithPredicate:nil];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.fetchedResultsController.fetchedObjects.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark - Helper Methods

- (NSFetchedResultsController *)fetchedResultsControllerWithPredicate:(NSPredicate *)predicate
{
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Combination entityName]];
    fetchRequest.fetchBatchSize = 20;
    fetchRequest.predicate = predicate;
    fetchRequest.sortDescriptors = @[];
    NSFetchedResultsController *newResultsController = [[NSFetchedResultsController alloc]
                                                        initWithFetchRequest:fetchRequest
                                                        managedObjectContext:[CoreDataController sharedCDController].managedObjectContext
                                                        sectionNameKeyPath:nil
                                                        cacheName:@"Root"];
    [newResultsController performFetch:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching item data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    return newResultsController;
}

@end
