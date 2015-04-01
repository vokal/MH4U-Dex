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
#import "CoreDataController.h"
#import "Strings.h"

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
    NSManagedObjectContext *managedObjectContext = [CoreDataController sharedCDController].managedObjectContext;
    NSError *fetchError = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[MonsterDrop entityName]];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:MonsterDropAttributes.id ascending:YES];
    NSPredicate *dropPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropRelationships.monsterSource, self.monster];
    NSPredicate *rankPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropAttributes.rank, self.rank ?: @"Low"];
    NSCompoundPredicate *compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[dropPredicate, rankPredicate]];
    fetchRequest.predicate = compoundPredicate;
    fetchRequest.sortDescriptors = @[sortDescriptor];
    
    self.drops = [managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    self.tableView.accessibilityIdentifier = MHDMonsterDropsTable;
    
    if (self.drops.count) {
        // The tableHeaderView is only used to display a message if there are no contents in the tableView.
        self.tableView.tableHeaderView = nil;
    } else {
       self.tableView.tableFooterView = [UIView new];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMonsterEncyclopedia"]) {
        MonsterEncyclopediaViewController *monsterVC = (MonsterEncyclopediaViewController *)segue.destinationViewController;
        monsterVC.navigationItem.title = [Strings MHDMonsterEncyclopedia];
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
    MonsterDrop *drop = self.drops[indexPath.row];
    itemVC.item = [drop valueForKey:MonsterDropRelationships.item];
    [self.navigationController pushViewController:itemVC animated:YES];
}

@end
