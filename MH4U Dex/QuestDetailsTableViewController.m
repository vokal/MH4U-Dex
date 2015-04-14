//
//  QuestDetailsTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/13/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestDetailsTableViewController.h"

#import "Constants.h"

#import "Monster.h"
#import "Quest.h"
#import "Region.h"

#import "MonsterContainerViewController.h"

typedef NS_ENUM(NSInteger, QuestDetailSections) {
    DetailsSection = 0,
    MonstersSection = 1
};

@interface QuestDetailsTableViewController ()

@property (nonatomic, strong) NSDictionary *questDetailsDict;
@property (nonatomic, strong) NSArray *questMonsters;
@property (nonatomic, strong) NSArray *questDetailLabels;

@end

@implementation QuestDetailsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.questDetailLabels = @[
                               @"Caravan/Hall",
                               @"Stars",
                               @"Objective",
                               @"Sub Objective",
                               @"Quest Type",
                               @"Key Quest",
                               @"Urgent Quest",
                               @"Unstable Quest",
                               @"Quest Fee",
                               @"Zenny Reward",
                               @"HRP Reward",
                               @"Quest Region",
                               ];
    self.questDetailsDict = @{
                               self.questDetailLabels[0]: self.quest.caravan,
                               self.questDetailLabels[1]: self.quest.stars,
                               self.questDetailLabels[2]: self.quest.objective,
                               self.questDetailLabels[3]: self.quest.subObjective,
                               self.questDetailLabels[4]: self.quest.type,
                               self.questDetailLabels[5]: self.quest.keyQuest,
                               self.questDetailLabels[6]: self.quest.urgent,
                               self.questDetailLabels[7]: self.quest.danger,
                               self.questDetailLabels[8]: self.quest.fee,
                               self.questDetailLabels[9]: self.quest.reward,
                               self.questDetailLabels[10]: self.quest.hrp,
                               self.questDetailLabels[11]: self.quest.region.name,
                               };
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:MonsterAttributes.sort_name ascending:YES];
    self.questMonsters = [self.quest.monster sortedArrayUsingDescriptors:@[descriptor]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // We always need a general details section, but we don't need a section for the quest's monsters if the quest has no monsters.
    return self.questMonsters.count ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case DetailsSection:
            return self.questDetailLabels.count;
            break;
        case MonstersSection:
            return self.questMonsters.count;
            break;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView detailCellForIndexPath:(NSIndexPath *)indexPath
{
    //TODO: Consider wrapping relevant strings with NSLocalizedString and moving to Strings.h
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestDetailCell" forIndexPath:indexPath];
    cell.userInteractionEnabled = NO;
    NSString *rowKey = self.questDetailLabels[indexPath.row];
    cell.textLabel.text = rowKey;
    if ([self.questDetailsDict[rowKey] isKindOfClass:[NSNumber class]]) {
        NSNumber *number = self.questDetailsDict[rowKey];
        if (rowKey == self.questDetailLabels[0]) {
            // A quest is either a Caravan or a Hall quest.  This is stored as a bool number, and needs to be converted.
            cell.detailTextLabel.text = (number.boolValue) ? @"Caravan" : @"Gathering Hall";
        } else if (rowKey == self.questDetailLabels[5]
                   || rowKey == self.questDetailLabels[6]
                   || rowKey == self.questDetailLabels[7]) {
            // These three numbers represent boolean values
            cell.detailTextLabel.text = (number.boolValue) ? @"True" : @"False";
        } else {
            // All other numbers represent actual numbers.
            cell.detailTextLabel.text = number.stringValue;
        }
    } else {
        // If the entry is nil, (as may be the case for some quest regions) write "Other"
        cell.detailTextLabel.text = self.questDetailsDict[rowKey] ?: @"Other";
    }
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView monsterCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO: Consider wrapping relevant strings with NSLocalizedString and moving to Strings.h
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestDetailCell" forIndexPath:indexPath];
    cell.userInteractionEnabled = YES;
    Monster *monster = [self monsterForIndexPath:indexPath];
    cell.textLabel.text = @"Large Monster";
    cell.detailTextLabel.text = monster.name;

    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case DetailsSection:
            return [self tableView:tableView detailCellForIndexPath:indexPath];
        case MonstersSection:
            return [self tableView:tableView monsterCellForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:MHDStoryBoardIdentifier.main bundle:nil];
    MonsterContainerViewController *monsterVC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([MonsterContainerViewController class])];
    switch (indexPath.section) {
        case DetailsSection:
            //Do nothing.
            return;
        case MonstersSection:
            // Push Monster's view.
            monsterVC.monster = [self monsterForIndexPath:indexPath];
            [self.navigationController pushViewController:monsterVC animated:YES];
            return;
    }
}

#pragma mark - Helper Methods

- (Monster *)monsterForIndexPath:(NSIndexPath *)indexPath
{
    return self.questMonsters[indexPath.row];
}

@end
