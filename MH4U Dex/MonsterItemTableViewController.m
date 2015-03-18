//
//  MonsterItemTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterItemTableViewController.h"

#import <CoreData/CoreData.h>

#import "Constants.h"

#import "ItemContainerViewController.h"
#import "MonsterEncyclopediaViewController.h"

#import "Item.h"
#import "Monster.h"
#import "MonsterDrop.h"

#import "DropTableViewCell.h"

@interface MonsterItemTableViewController ()

@property (nonatomic, strong) NSArray *drops;

@end

@implementation MonsterItemTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSError *fetchError = nil;
    NSFetchRequest *monsterFetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Monster entityName]];
    monsterFetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, self.monsterName];
    Monster *monster = (Monster *)[self.managedObjectContext executeFetchRequest:monsterFetchRequest error:&fetchError].firstObject;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[MonsterDrop entityName]];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:MonsterDropAttributes.method ascending:YES];
    NSPredicate *dropPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropRelationships.monsterSource, monster];
    NSPredicate *rankPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropAttributes.rank, self.rank ?: @"Low"];
    NSCompoundPredicate *compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[dropPredicate, rankPredicate]];
    fetchRequest.predicate = compoundPredicate;
    fetchRequest.sortDescriptors = @[sortDescriptor];
    
    self.drops = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMonsterEncyclopedia"]) {
        MonsterEncyclopediaViewController *monsterVC = (MonsterEncyclopediaViewController *)segue.destinationViewController;
        monsterVC.managedObjectContext = self.managedObjectContext;
        monsterVC.navigationItem.title = MonsterEncyclopedia;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DropTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DropTableViewCell"];
    [cell displayContentsOfMonsterDrop:self.drops[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.drops.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ItemContainerViewController *itemVC = [storyBoard instantiateViewControllerWithIdentifier:@"ItemContainerViewController"];
    itemVC.managedObjectContext = self.managedObjectContext;
    MonsterDrop *drop = self.drops[indexPath.row];
    Item *item = [drop valueForKey:MonsterDropRelationships.item];
    itemVC.itemName = item.name;
    [self.navigationController pushViewController:itemVC animated:YES];
}

@end
