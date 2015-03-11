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
@property (nonatomic, strong) NSMutableDictionary *areaDrops;

@end

@implementation RegionItemTableViewController

- (void)viewDidLoad
{
    CoreDataController *coreDataController = [CoreDataController sharedCDController];
    self.areaDrops = [NSMutableDictionary dictionary];
    NSError *fetchError = nil;
    NSSortDescriptor *areaSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSFetchRequest *areaFetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Area entityName]];
    NSPredicate *areaPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"region", self.region];
    //TODO: Support all ranks.
    NSPredicate *rankPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"rank", @"Low"];
    NSCompoundPredicate *compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[rankPredicate, areaPredicate]];
    [areaFetchRequest setPredicate:compoundPredicate];
    [areaFetchRequest setSortDescriptors:@[areaSortDescriptor]];
    self.areaArray = [coreDataController.managedObjectContext executeFetchRequest:areaFetchRequest error:&fetchError];
    
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.areaArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Area *area = self.areaArray[section];
    NSSet *drops = area.drop;
    return drops.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Area *area = self.areaArray[indexPath.section];
    NSSortDescriptor *dropSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"idDecimalString" ascending:YES];
    NSArray *dropsArray = [area.drop sortedArrayUsingDescriptors:@[dropSortDescriptor]];
    AreaDrop *drop = dropsArray[indexPath.row];
    AreaDropTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AreaDropTableViewCell"];
    [cell displayContentsWithAreaDrop:drop];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ItemContainerViewController *itemVC = [storyBoard instantiateViewControllerWithIdentifier:@"ItemContainerViewController"];
    CoreDataController *coreDataController = [CoreDataController sharedCDController];
    itemVC.managedObjectContext = coreDataController.managedObjectContext;
    Area *area = self.areaArray[indexPath.section];
    NSSortDescriptor *dropSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"idDecimalString" ascending:YES];
    NSArray *dropsArray = [area.drop sortedArrayUsingDescriptors:@[dropSortDescriptor]];
    AreaDrop *drop = dropsArray[indexPath.row];
    itemVC.itemName = drop.item.name;
    [self.navigationController pushViewController:itemVC animated:YES];
}

@end
