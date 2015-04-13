//
//  QuestRewardsTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/13/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestRewardsTableViewController.h"

#import "Constants.h"
#import "CoreDataController.h"

#import "ItemContainerViewController.h"

#import "Item.h"
#import "Quest.h"
#import "QuestDrop.h"

#import "QuestRewardTableViewCell.h"

typedef NS_ENUM(NSInteger, QuestRewardRows) {
    RowA = 0,
    RowB = 1,
    SubRow = 2,
    
    QuestRewardRowCount
};

@interface QuestRewardsTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation QuestRewardsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSPredicate *questPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestDropRelationships.quest, self.quest];
    self.fetchedResultsController = [self fetchedResultsControllerWithPredicate:questPredicate];
    self.fetchedResultsController.delegate = self;
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
    QuestRewardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QuestRewardTableViewCell class]) forIndexPath:indexPath];
    [cell configureCellForQuestDrop:[self questDropForIndexPath:indexPath]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case RowA:
            return @"Row A";
        case RowB:
            return @"Row B";
        case SubRow:
            return @"Subquest";
        default:
            return nil;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:MHDSegueIdentifier.showQuestDropItem]) {
        ItemContainerViewController *itemVC = (ItemContainerViewController *)segue.destinationViewController;
        if ([sender isMemberOfClass:[QuestRewardTableViewCell class]]) {
            QuestRewardTableViewCell *cell = (QuestRewardTableViewCell *)sender;
             itemVC.item = [self questDropForIndexPath:[self.tableView indexPathForCell:cell]].item;
        }
    }
}

#pragma mark - Helper Methods

- (NSFetchedResultsController *)fetchedResultsControllerWithPredicate:(NSPredicate *)predicate
{
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[QuestDrop entityName]];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:DropAttributes.percent ascending:NO]];
    fetchRequest.fetchBatchSize = 20;
    fetchRequest.predicate = predicate;
    NSFetchedResultsController *newResultsController = [[NSFetchedResultsController alloc]
                                                        initWithFetchRequest:fetchRequest
                                                        managedObjectContext:[CoreDataController sharedCDController].managedObjectContext
                                                        sectionNameKeyPath:QuestDropAttributes.row
                                                        cacheName:@"Root"];
    [newResultsController performFetch:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching  quest drop data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    return newResultsController;
}

- (QuestDrop *)questDropForIndexPath:(NSIndexPath *)indexpath
{
    return [self.fetchedResultsController objectAtIndexPath:indexpath];
}

@end
