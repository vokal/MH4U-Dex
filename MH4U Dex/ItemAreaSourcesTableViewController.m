//
//  ItemAreaSourcesTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemAreaSourcesTableViewController.h"

#import <CoreData/CoreData.h>

#import "RegionContainerViewController.h"

#import "Area.h"
#import "AreaDrop.h"
#import "Item.h"
#import "Region.h"

#import "ItemAreaSourceTableViewCell.h"

@interface ItemAreaSourcesTableViewController ()

@property (nonatomic, strong) NSArray *sources;

@end

@implementation ItemAreaSourcesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *fetchError = nil;
    NSFetchRequest *itemFetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Item entityName]];
    itemFetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, self.itemName];
    Item *item = (Item *)[self.managedObjectContext executeFetchRequest:itemFetchRequest error:&fetchError].firstObject;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[AreaDrop entityName]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaDropRelationships.item, item];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AreaDropAttributes.idDecimalString ascending:YES]];
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
    ItemAreaSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemAreaSourceTableViewCell class]) forIndexPath:indexPath];
    [cell displayContentsWithAreaDrop:self.sources[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegionContainerViewController *regionVC = [storyBoard instantiateViewControllerWithIdentifier:@"RegionContainerViewController"];
    regionVC.region = [self dropAtIndexPath:indexPath].area.region;
    [self.navigationController pushViewController:regionVC animated:YES];
}

#pragma mark - Helper Methods

- (AreaDrop *)dropAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sources[indexPath.row];
}

@end
