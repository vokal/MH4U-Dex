//
//  MonsterQuestsTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/14/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterQuestsTableViewController.h"

#import "UITableViewController+HeaderFooterChanger.h"

#import "Monster.h"
#import "Quest.h"
#import "Region.h"

#import "QuestContainerViewController.h"

@interface MonsterQuestsTableViewController ()

@property (nonatomic, strong) NSArray *questArray;

@end

@implementation MonsterQuestsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:QuestAttributes.id ascending:YES];
    if (self.isMonsterLink) {
        self.questArray = [self.monster.quest sortedArrayUsingDescriptors:@[sortDescriptor]];
    } else {
        self.questArray = [self.region.quest sortedArrayUsingDescriptors:@[sortDescriptor]];
    }
    [self mhd_changeHeaderFooterForArray:self.questArray];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.questArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MonsterQuestCell" forIndexPath:indexPath];
    Quest *quest = [self questForIndexPath:indexPath];
    cell.textLabel.text = quest.name;
    NSString *caravanHallString = quest.caravanValue ? @"Caravan" : @"Gathering Hall";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@-Star %@", quest.stars, caravanHallString];
    
    return cell;
}

#pragma mark - Helper methods

- (Quest *)questForIndexPath:(NSIndexPath *)indexPath
{
    return self.questArray[indexPath.row];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showQuestContainer"]) {
        QuestContainerViewController *questVC = (QuestContainerViewController *)segue.destinationViewController;
        UITableViewCell *cell = (UITableViewCell *)sender;
        questVC.quest = [self questForIndexPath:[self.tableView indexPathForCell:cell]];
    }
}

@end
