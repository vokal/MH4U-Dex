//
//  ItemSourcesTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemSourcesTableViewController.h"

#import <CoreData/CoreData.h>

#import "Constants.h"
#import "CoreDataController.h"

#import "MonsterContainerViewController.h"
#import "RegionContainerViewController.h"

#import "Area.h"
#import "AreaDrop.h"
#import "Drop.h"
#import "Item.h"
#import "Monster.h"
#import "MonsterDrop.h"

#import "ItemSourceTableViewCell.h"

@interface ItemSourcesTableViewController ()

@property (nonatomic, strong) NSArray *sources;

@end

@implementation ItemSourcesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSManagedObjectContext *managedObjectContext = [CoreDataController sharedCDController].managedObjectContext;
    NSError *fetchError = nil;
    NSFetchRequest *itemFetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Item entityName]];
    itemFetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, self.itemName];
    Item *item = (Item *)[managedObjectContext executeFetchRequest:itemFetchRequest error:&fetchError].firstObject;
    NSFetchRequest *fetchRequest;
    if (self.isMonsterSource) {
        fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[MonsterDrop entityName]];
        fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropRelationships.item, item];
        fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MonsterDropAttributes.id ascending:YES]];
        self.tableView.accessibilityIdentifier = MHDItemMonsterSources;
    } else {
        
        fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[AreaDrop entityName]];
        fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaDropRelationships.item, item];
        fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AreaDropAttributes.idDecimalString ascending:YES]];
        self.tableView.accessibilityHint = MHDItemAreaSources;
    }
    self.sources = [managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    // If the fetch failed (most likely because the item cannot be found from any monsters/areas) ...
    if (!self.sources) {
        // Set sources to empty.
        self.sources = @[];
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
    ItemSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemSourceTableViewCell class])];
    [cell displayContentsWithDrop:self.sources[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (self.isMonsterSource) {
        MonsterContainerViewController *monsterVC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([MonsterContainerViewController class])];
        MonsterDrop *drop = (MonsterDrop *)[self dropAtIndexPath:indexPath];
        monsterVC.monster = drop.monsterSource;
        [self.navigationController pushViewController:monsterVC animated:YES];
    } else {
        RegionContainerViewController *regionVC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([RegionContainerViewController class])];
        AreaDrop *drop = (AreaDrop *)[self dropAtIndexPath:indexPath];
        regionVC.region = drop.area.region;
        [self.navigationController pushViewController:regionVC animated:YES];
    }
}

#pragma mark - Helper Methods

- (Drop *)dropAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sources[indexPath.row];
}

@end
