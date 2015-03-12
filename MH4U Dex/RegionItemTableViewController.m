//
//  RegionItemTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "RegionItemTableViewController.h"

#import <CoreData/CoreData.h>

#import "CoreDataController.h"
#import "Area.h"
#import "AreaDrop.h"
#import "Item.h"

#import "AreaDropTableViewCell.h"
#import "ItemContainerViewController.h"

@interface RegionItemTableViewController ()

@property (nonatomic, strong) NSArray *areaArray;
@property (nonatomic, strong) NSMutableDictionary *areaDropsArray;

@end

@implementation RegionItemTableViewController

- (void)viewDidLoad
{
    CoreDataController *coreDataController = [CoreDataController sharedCDController];
    NSError *fetchError = nil;
    NSSortDescriptor *areaSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:AreaAttributes.name ascending:YES];
    NSFetchRequest *areaFetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Area entityName]];
    NSPredicate *areaPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaRelationships.region, self.region];
    //TODO: Support all ranks.
    NSPredicate *rankPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaAttributes.rank, @"Low"];
    NSCompoundPredicate *compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[rankPredicate, areaPredicate]];
    [areaFetchRequest setPredicate:compoundPredicate];
    [areaFetchRequest setSortDescriptors:@[areaSortDescriptor]];
    self.areaArray = [coreDataController.managedObjectContext executeFetchRequest:areaFetchRequest error:&fetchError];
    self.areaDropsArray = [NSMutableDictionary dictionary];
    for (Area *area in self.areaArray) {
        NSSortDescriptor *dropSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:AreaDropAttributes.idDecimalString ascending:YES];
        NSArray *dropsArray = [area.drop sortedArrayUsingDescriptors:@[dropSortDescriptor]];
        [self.areaDropsArray setObject:dropsArray forKey:area.combinedName];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.areaArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Area *area = self.areaArray[section];
    return area.drop.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Area *area = self.areaArray[indexPath.section];
    NSArray *dropsArray = self.areaDropsArray[area.combinedName];
    AreaDrop *areaDrop = dropsArray[indexPath.row];
    AreaDropTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AreaDropTableViewCell"];
    [cell displayContentsWithAreaDrop:areaDrop];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ItemContainerViewController *itemVC = [storyBoard instantiateViewControllerWithIdentifier:@"ItemContainerViewController"];
    CoreDataController *coreDataController = [CoreDataController sharedCDController];
    itemVC.managedObjectContext = coreDataController.managedObjectContext;
    Area *area = self.areaArray[indexPath.section];
    NSArray *dropsArray = self.areaDropsArray[area.combinedName];
    AreaDrop *drop = dropsArray[indexPath.row];
    itemVC.itemName = drop.item.name;
    [self.navigationController pushViewController:itemVC animated:YES];
}

@end
