//
//  ItemSourcesTableViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemSourcesTableViewController.h"

#import <CoreData/CoreData.h>

#import "UITableViewController+HeaderFooterChanger.h"

#import "Constants.h"
#import "CoreDataController.h"

#import "MonsterContainerViewController.h"
#import "RegionContainerViewController.h"
#import "QuestContainerViewController.h"

#import "Area.h"
#import "AreaDrop.h"
#import "Drop.h"
#import "Item.h"
#import "Monster.h"
#import "MonsterDrop.h"
#import "Quest.h"
#import "QuestDrop.h"

#import "ItemSourceTableViewCell.h"

@interface ItemSourcesTableViewController ()

@property (nonatomic, strong) NSArray *sources;

@end

@implementation ItemSourcesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([self.sourceType isEqualToString:@"Monster"]) {
        self.sources = [self.item.monsterSource sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:MonsterDropAttributes.id ascending:YES]]];
        self.tableView.accessibilityIdentifier = MHDItemMonsterSources;
    } else if ([self.sourceType isEqualToString:@"Area"]) {
        self.sources = [self.item.areaSource sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:AreaDropAttributes.idDecimalString ascending:YES]]];
        self.tableView.accessibilityIdentifier = MHDItemAreaSources;
    } else {
        self.sources = [self.item.questSource sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:DropAttributes.percent ascending:NO]]];
        self.tableView.accessibilityHint = MHDItemQuestSources;
    }
    // If the item cannot be found from any monsters/areas ...
    if (!self.sources) {
        // Set sources to empty.
        self.sources = @[];
    }
    [self mhd_changeHeaderFooterForArray:self.sources];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ItemSourceTableViewCell class])];
    [cell displayContentsWithDrop:[self dropAtIndexPath:indexPath]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if ([self.sourceType isEqualToString:@"Monster"]) {
        MonsterContainerViewController *monsterVC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([MonsterContainerViewController class])];
        MonsterDrop *drop = (MonsterDrop *)[self dropAtIndexPath:indexPath];
        monsterVC.monster = drop.monsterSource;
        [self.navigationController pushViewController:monsterVC animated:YES];
    } else if ([self.sourceType isEqualToString:@"Area"]) {
        RegionContainerViewController *regionVC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([RegionContainerViewController class])];
        AreaDrop *drop = (AreaDrop *)[self dropAtIndexPath:indexPath];
        regionVC.region = drop.area.region;
        [self.navigationController pushViewController:regionVC animated:YES];
    } else {
        QuestContainerViewController *questVC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([QuestContainerViewController class])];
        QuestDrop *drop = (QuestDrop *)[self dropAtIndexPath:indexPath];
        questVC.quest = drop.quest;
        [self.navigationController pushViewController:questVC animated:YES];
    }
}

#pragma mark - Helper Methods

- (Drop *)dropAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sources[indexPath.row];
}

@end
