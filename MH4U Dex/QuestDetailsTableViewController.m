//
//  QuestDetailsTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/13/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestDetailsTableViewController.h"

#import "Monster.h"
#import "Quest.h"

#import "MonsterContainerViewController.h"

typedef NS_ENUM(NSInteger, QuestDetailEntries) {
    CaravanOrHall = 0,
    Stars = 1,
    Objective = 2,
    SubObjective = 3,
    Type = 4,
    Key = 5,
    Urgent = 6,
    Danger = 7,
    Fee = 8,
    RewardMoney = 9,
    RewardPoints = 10,
    
    QuestDetailEntriesCount
};

static NSString *CaravanHallConst = @"Caravan/Hall";
static NSString *StarsConst = @"Stars";
static NSString *ObjectiveConst = @"Objective";
static NSString *SubObjectiveConst = @"Sub Objective";
static NSString *TypeConst = @"Quest Type";
static NSString *KeyConst = @"Key Quest";
static NSString *UrgentConst = @"Urgent Quest";
static NSString *DangerConst = @"Unstable Quest";
static NSString *FeeConst = @"Quest Fee";
static NSString *RewardConst = @"Zenny Reward";
static NSString *PointsConst = @"HRP Reward";

@interface QuestDetailsTableViewController ()

@property (nonatomic, strong) NSDictionary *questDetailsDict;
@property (nonatomic, strong) NSArray *questMonsters;

@end

@implementation QuestDetailsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.questDetailsDict = @{
                               CaravanHallConst: self.quest.caravan,
                               StarsConst: self.quest.stars,
                               ObjectiveConst: self.quest.objective,
                               SubObjectiveConst: self.quest.subObjective,
                               TypeConst: self.quest.type,
                               KeyConst: self.quest.keyQuest,
                               UrgentConst: self.quest.urgent,
                               DangerConst: self.quest.danger,
                               FeeConst: self.quest.fee,
                               RewardConst: self.quest.reward,
                               PointsConst: self.quest.hrp,
                               };
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:MonsterAttributes.sort_name ascending:YES];
    self.questMonsters = [self.quest.monster sortedArrayUsingDescriptors:@[descriptor]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.questMonsters.count ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return QuestDetailEntriesCount;
            break;
        case 1:
            return self.questMonsters.count;
            break;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO: Consider wrapping relevant strings with NSLocalizedString and moving to Strings.h
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestDetailCell" forIndexPath:indexPath];
    NSString *rowKey;
    Monster *monster;
    switch (indexPath.section) {
        case 0:
            cell.userInteractionEnabled = NO;
            switch (indexPath.row) {
                case CaravanOrHall:
                    rowKey = CaravanHallConst;
                    break;
                case Stars:
                    rowKey = StarsConst;
                    break;
                case Objective:
                    rowKey = ObjectiveConst;
                    break;
                case SubObjective:
                    rowKey = SubObjectiveConst;
                    break;
                case Type:
                    rowKey = TypeConst;
                    break;
                case Key:
                    rowKey = KeyConst;
                    break;
                case Urgent:
                    rowKey = UrgentConst;
                    break;
                case Danger:
                    rowKey = DangerConst;
                    break;
                case Fee:
                    rowKey = FeeConst;
                    break;
                case RewardMoney:
                    rowKey = RewardConst;
                    break;
                case RewardPoints:
                    rowKey = PointsConst;
                    break;
            }
            cell.textLabel.text = rowKey;
            if ([self.questDetailsDict[rowKey] isKindOfClass:[NSNumber class]]) {
                NSNumber *number = self.questDetailsDict[rowKey];
                if (rowKey == CaravanHallConst) {
                    cell.detailTextLabel.text = (number.boolValue) ? @"Caravan" : @"Gathering Hall";
                } else if (rowKey == KeyConst
                           || rowKey == UrgentConst
                           || rowKey == DangerConst) {
                    cell.detailTextLabel.text = (number.boolValue) ? @"True" : @"False";
                } else {
                    cell.detailTextLabel.text = number.stringValue;
                }
            } else {
                cell.detailTextLabel.text = self.questDetailsDict[rowKey];
            }
            break;
        case 1:
            cell.userInteractionEnabled = YES;
            monster = self.questMonsters[indexPath.row];
            cell.textLabel.text = @"Large Monster";
            cell.detailTextLabel.text = monster.name;
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MonsterContainerViewController *monsterVC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([MonsterContainerViewController class])];
    switch (indexPath.section) {
        case 0:
            //Do nothing.
            return;
        case 1:
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
