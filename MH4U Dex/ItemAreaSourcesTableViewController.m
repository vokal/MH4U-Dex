//
//  ItemAreaSourcesTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemAreaSourcesTableViewController.h"

#import "RegionEncyclopediaCollectionViewController.h"

#import "Item.h"
#import "Area.h"
#import "AreaDrop.h"

#import "ItemAreaSourceTableViewCell.h"

#import <CoreData/CoreData.h>


@interface ItemAreaSourcesTableViewController ()

@property (nonatomic, strong) NSArray *sources;

@end

@implementation ItemAreaSourcesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *fetchError = nil;
    NSFetchRequest *itemFetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Item"];
    NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", self.itemName];
    [itemFetchRequest setPredicate:itemPredicate];
    Item *item = (Item *)[self.managedObjectContext executeFetchRequest:itemFetchRequest error:&fetchError].firstObject;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"AreaDrop"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"idDecimalString" ascending:YES];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaDropRelationships.item, item];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    self.sources = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    // If the fetch failed (most likely because the item cannot be found from any areas) ...
    if (!self.sources) {
        // Set sources to empty.
        self.sources = [NSArray arrayWithObjects:nil];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.sources.count) {
        return self.sources.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemAreaSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemAreaSourceTableViewCell class])];
    AreaDrop *drop = self.sources[indexPath.row];
    cell.method = drop.method;
    Area *area = [drop valueForKey:AreaDropRelationships.area];
    cell.sourceName = area.combinedName;
    [cell displayContents];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // ToDo: chage to specific area/region once area/region views are in.
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegionEncyclopediaCollectionViewController *regionVC = [storyBoard instantiateViewControllerWithIdentifier:@"RegionEncyclopediaCollectionViewController"];
    regionVC.managedObjectContext = self.managedObjectContext;
    [self.navigationController pushViewController:regionVC animated:YES];
}

@end
