//
//  ItemEncyclopediaTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemEncyclopediaTableViewController.h"

#import <CoreData/CoreData.h>

#import "Constants.h"
#import "CoreDataController.h"

#import "ItemContainerViewController.h"

#import "Item.h"

#import "ItemTableViewCell.h"

@interface ItemEncyclopediaTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ItemEncyclopediaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Item entityName]];
    //Look at NSFetchedResultsController
    //Look at which is newer: UISearchController and UISearchViewController
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ItemAttributes.name ascending:YES]];
    fetchRequest.fetchBatchSize = 20;//TODO: Tinker with this.
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[CoreDataController sharedCDController].managedObjectContext sectionNameKeyPath:@"firstLetter" cacheName:@"Root"];
    [self.fetchedResultsController performFetch:&fetchError];
   // NSArray *array = [[CoreDataController sharedCDController].managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching item data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    self.fetchedResultsController.delegate = self;
    self.tableView.accessibilityIdentifier = MHDItemEncyclopediaTableIdentifier;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.fetchedResultsController.sections objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemTableViewCell class])];
    [cell displayContentsWithItem:[self itemAtIndexPath:indexPath]];
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
    return [self.fetchedResultsController sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}

#pragma mark - Helper Methods

- (Item *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    Item *item = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return item;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showItemDetails"]) {
        ItemContainerViewController *itemVC = (ItemContainerViewController *)segue.destinationViewController;
        if ([sender isMemberOfClass:[ItemTableViewCell class]]) {
            ItemTableViewCell *cell = (ItemTableViewCell *)sender;
            itemVC.itemName = [self itemAtIndexPath:[self.tableView indexPathForCell:cell]].name;
        }
    }
}

#pragma mark - Fetched Results Controller Delegate Methods

@end
