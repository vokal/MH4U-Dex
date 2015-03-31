//
//  RegionItemTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "RegionItemTableViewController.h"

#import <CoreData/CoreData.h>

#import "Constants.h"
#import "CoreDataController.h"

#import "ItemContainerViewController.h"

#import "Area.h"
#import "AreaDrop.h"
#import "Item.h"
#import "Region.h"

#import "AreaDropTableViewCell.h"

@interface RegionItemTableViewController ()

@property (nonatomic, strong) NSArray *areaArray;
@property (nonatomic, strong) NSMutableDictionary *areaDropsDict;

@end

@implementation RegionItemTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CoreDataController *coreDataController = [CoreDataController sharedCDController];
    NSError *fetchError = nil;
    NSFetchRequest *areaFetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Area entityName]];
    NSPredicate *areaPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaRelationships.region, self.region];
    NSPredicate *rankPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaAttributes.rank, self.rank ?: MHDLowConstString];
    areaFetchRequest.predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[rankPredicate, areaPredicate]];
    areaFetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AreaAttributes.name ascending:YES]];
    self.areaArray = [coreDataController.managedObjectContext executeFetchRequest:areaFetchRequest error:&fetchError];
    self.areaDropsDict = [NSMutableDictionary dictionary];
    NSSortDescriptor *dropSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:AreaDropAttributes.idDecimalString ascending:YES];
    NSArray *sortDescriptors = @[dropSortDescriptor];
    for (Area *area in self.areaArray) {
        NSArray *dropsArray = [area.drop sortedArrayUsingDescriptors:sortDescriptors];
        self.areaDropsDict[area.combinedName] = dropsArray;
    }
    self.tableView.accessibilityIdentifier = MHDAreaDropsTable;
    if (self.areaArray.count) {
        // The tableHeaderView is only used to display a message if there are no contents in the tableView.
        self.tableView.tableHeaderView = nil;
    } else {
        // This is a bit of a hacky way to make it appear as if there is no tableView.
        self.tableView.backgroundColor = self.tableView.tableHeaderView.backgroundColor;
        self.tableView.scrollEnabled = NO;
        self.tableView.separatorColor = [UIColor clearColor];
    }
}

#pragma mark - Helper Methods

- (Area *)areaAtSection:(NSInteger)section
{
    return self.areaArray[section];
}

- (NSArray *)areaDropsForKey:(NSString *)key
{
    return self.areaDropsDict[key];
}

- (AreaDrop *)areaDropForIndexPath:(NSIndexPath *)indexPath
{
    Area *area = [self areaAtSection:indexPath.section];
    NSArray *dropsArray = [self areaDropsForKey:area.combinedName];
    return dropsArray[indexPath.row];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.areaArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self areaAtSection:section].drop.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AreaDropTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AreaDropTableViewCell"];
    [cell displayContentsWithAreaDrop:[self areaDropForIndexPath:indexPath]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ItemContainerViewController *itemVC = [storyBoard instantiateViewControllerWithIdentifier:@"ItemContainerViewController"];
    itemVC.itemName = [self areaDropForIndexPath:indexPath].item.name;
    [self.navigationController pushViewController:itemVC animated:YES];
}

@end
