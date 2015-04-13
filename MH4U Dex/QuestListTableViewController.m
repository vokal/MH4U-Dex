//
//  QuestListTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/16/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestListTableViewController.h"

#import <CoreData/CoreData.h>

#import "CoreDataController.h"

#import "Quest.h"

#import "QuestContainerViewController.h"

#import "QuestListTableViewCell.h"

@interface QuestListTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation QuestListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSPredicate *caravanPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestAttributes.caravan, @(self.isCaravan)];
    self.fetchedResultsController = [self fetchedResultsControllerWithPredicate:caravanPredicate];
    self.fetchedResultsController.delegate = self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    QuestContainerViewController *questVC = (QuestContainerViewController *)segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showQuestContainerView"]) {
        if ([sender isMemberOfClass:[QuestListTableViewCell class]]) {
            QuestListTableViewCell *cell = (QuestListTableViewCell *)sender;
            questVC.quest = [self questAtIndexPath:[self.tableView indexPathForCell:cell]];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return [self.fetchedResultsController.sections[section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QuestListTableViewCell class]) forIndexPath:indexPath];
    [cell displayContentsWithQuest:[self questAtIndexPath:indexPath]];
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:self.fetchedResultsController.sectionIndexTitles];
    if ([mutArray.lastObject isEqualToString:@"1"]) {
        [mutArray removeLastObject];
        [mutArray addObject:@"10"];
    }
    
    return mutArray;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%@-Star Quests", @(section + 1)];
}

#pragma mark - Helper Methods

- (Quest *)questAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (NSFetchedResultsController *)fetchedResultsControllerWithPredicate:(NSPredicate *)predicate
{
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Quest entityName]];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:QuestAttributes.id ascending:YES]];
    fetchRequest.fetchBatchSize = 20;//TODO: Tinker with this.
    fetchRequest.predicate = predicate;
    NSFetchedResultsController *newResultsController = [[NSFetchedResultsController alloc]
                                                        initWithFetchRequest:fetchRequest
                                                        managedObjectContext:[CoreDataController sharedCDController].managedObjectContext
                                                        sectionNameKeyPath:QuestAttributes.stars
                                                        cacheName:@"Root"];
    [newResultsController performFetch:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching quest data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    return newResultsController;
}

@end
