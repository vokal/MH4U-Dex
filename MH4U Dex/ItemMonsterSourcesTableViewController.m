//
//  ItemMonsterSourcesTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemMonsterSourcesTableViewController.h"

#import <CoreData/CoreData.h>

#import "MonsterDetailsViewController.h"

#import "Item.h"
#import "Monster.h"
#import "MonsterDrop.h"

#import "ItemMonsterSourceTableViewCell.h"

@interface ItemMonsterSourcesTableViewController ()

@property (nonatomic, strong) NSArray *sources;

@end

@implementation ItemMonsterSourcesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *fetchError = nil;
    NSFetchRequest *itemFetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Item entityName]];
    itemFetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, self.itemName];
    Item *item = (Item *)[self.managedObjectContext executeFetchRequest:itemFetchRequest error:&fetchError].firstObject;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[MonsterDrop entityName]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropRelationships.item, item];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MonsterDropAttributes.id ascending:YES]];
    
    self.sources = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    // If the fetch failed (most likely because the item cannot be found from any monsters) ...
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
    ItemMonsterSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemMonsterSourceTableViewCell class])];
    [cell displayContentsWithMonsterDrop:self.sources[indexPath.row]];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MonsterDetailsViewController *monsterVC = [storyBoard instantiateViewControllerWithIdentifier:@"MonsterDetailsViewController"];
    monsterVC.managedObjectContext = self.managedObjectContext;
    monsterVC.monster = [self dropAtIndexPath:indexPath].monsterSource.name;
    [self.navigationController pushViewController:monsterVC animated:YES];
}

#pragma mark - Helper Methods

- (MonsterDrop *)dropAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sources[indexPath.row];
}

@end
