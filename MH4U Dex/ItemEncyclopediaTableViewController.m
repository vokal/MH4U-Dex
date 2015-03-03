//
//  ItemEncyclopediaTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemEncyclopediaTableViewController.h"

#import "ItemTableViewCell.h"
#import "Item.h"
#import "ItemContainerViewController.h"

#import <CoreData/CoreData.h>

@interface ItemEncyclopediaTableViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation ItemEncyclopediaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Item entityName]];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    self.items = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching item data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
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
    Item *item = self.items[indexPath.row];
    cell.itemName = item.name;
    [cell displayContents];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showItemDetails"]) {
        ItemContainerViewController *itemVC = (ItemContainerViewController *)segue.destinationViewController;
        itemVC.managedObjectContext = self.managedObjectContext;
        itemVC.itemName = [sender itemName];
    }
}

@end
