//
//  ItemMonsterSourcesTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemMonsterSourcesTableViewController.h"

#import "Item.h"
#import "MonsterDrop.h"
#import "Monster.h"

#import "MonsterDetailsViewController.h"

#import "ItemMonsterSourceTableViewCell.h"

#import <CoreData/CoreData.h>

@interface ItemMonsterSourcesTableViewController ()

@property (nonatomic, strong) NSArray *sources;

@end

@implementation ItemMonsterSourcesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *fetchError = nil;
    NSFetchRequest *itemFetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Item"];
    NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", self.itemName];
    [itemFetchRequest setPredicate:itemPredicate];
    Item *item = (Item *)[self.managedObjectContext executeFetchRequest:itemFetchRequest error:&fetchError].firstObject;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MonsterDrop"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropRelationships.item, item];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    self.sources = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    // If the fetch failed (most likely because the item cannot be found from any monsters) ...
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
    ItemMonsterSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemMonsterSourceTableViewCell class])];
    MonsterDrop *drop = self.sources[indexPath.row];
    cell.method = drop.method;
    Monster *monster = [drop valueForKey:MonsterDropRelationships.monsterSource];
    cell.sourceName = monster.name;
    [cell displayContents];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MonsterDetailsViewController *monsterVC = [storyBoard instantiateViewControllerWithIdentifier:@"MonsterDetailsViewController"];
    monsterVC.managedObjectContext = self.managedObjectContext;
    MonsterDrop *drop = self.sources[indexPath.row];
    Monster *monster = [drop valueForKey:MonsterDropRelationships.monsterSource];
    monsterVC.monster = monster.name;
    [self.navigationController pushViewController:monsterVC animated:YES];
}

@end
