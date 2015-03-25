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

@property (nonatomic, strong) NSArray *items;

@end

@implementation ItemEncyclopediaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Item entityName]];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ItemAttributes.name ascending:YES]];
    self.items = [[CoreDataController sharedCDController].managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching item data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    self.tableView.accessibilityIdentifier = MHDItemEncyclopediaTableIdentifier;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemTableViewCell class])];
    [cell displayContentsWithItem:[self itemAtIndexPath:indexPath]];
    return cell;
}

#pragma mark - Helper Methods

- (Item *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row];
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

@end
