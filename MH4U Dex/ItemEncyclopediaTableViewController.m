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
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@end

@implementation ItemEncyclopediaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fetchedResultsController = [self fetchedResultsControllerWithPredicate:nil];
    self.fetchedResultsController.delegate = self;
    self.searchBar.delegate = self;
    self.tableView.accessibilityIdentifier = MHDItemEncyclopediaTableIdentifier;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fetchedResultsController.sections[section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemTableViewCell class])];
    [cell displayContentsWithItem:[self itemAtIndexPath:indexPath]];
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
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

- (NSFetchedResultsController *)fetchedResultsControllerWithPredicate:(NSPredicate *)predicate
{
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Item entityName]];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ItemAttributes.name ascending:YES]];
    fetchRequest.fetchBatchSize = 20;//TODO: Tinker with this.
    fetchRequest.predicate = predicate;
    NSFetchedResultsController *newResultsController = [[NSFetchedResultsController alloc]
                                                        initWithFetchRequest:fetchRequest
                                                        managedObjectContext:[CoreDataController sharedCDController].managedObjectContext
                                                        sectionNameKeyPath:@"firstLetter"
                                                        cacheName:@"Root"];
    [newResultsController performFetch:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching item data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    return newResultsController;
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

#pragma mark - Search Bar Delegate Methods

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (!searchText.length) {
        self.fetchedResultsController = [self fetchedResultsControllerWithPredicate:nil];
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", ItemAttributes.name, searchText];
        self.fetchedResultsController = [self fetchedResultsControllerWithPredicate:predicate];
    }
    [self.tableView reloadData];
}

@end
