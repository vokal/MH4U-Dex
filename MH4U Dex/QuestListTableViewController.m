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

#import "QuestListTableViewCell.h"

typedef NS_ENUM(NSInteger, StarSections) {
    OneStarSection = 0,
    TwoStarSection = 1,
    ThreeStarSection = 2,
    FourStarSection = 3,
    FiveStarSection = 4,
    SixStarSection = 5,
    SevenStarSection = 6,
    EightStarSection = 7,
    NineStarSection = 8,
    TenStarSection = 9,
    
    StarSectionCount
};

@interface QuestListTableViewController ()

@property (nonatomic, strong) NSMutableArray *questMasterArray;

@end

@implementation QuestListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    CoreDataController *coreDataController = [CoreDataController sharedCDController];
    NSError *fetchError = nil;
    NSPredicate *caravanPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestAttributes.caravan, [NSNumber numberWithBool:self.isCaravan]];
    NSFetchRequest *questFetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Quest entityName]];
    self.questMasterArray = [NSMutableArray array];
    NSPredicate *starPredicate;
    NSCompoundPredicate *compoundPredicate;
    for (NSUInteger starNumber = 1; starNumber <= 10; starNumber++) {
        starPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestAttributes.stars, @(starNumber)];
        compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[caravanPredicate, starPredicate]];
        [questFetchRequest setPredicate:compoundPredicate];
        [self.questMasterArray addObject:[coreDataController.managedObjectContext executeFetchRequest:questFetchRequest error:&fetchError]];;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return StarSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *questList = [self questArrayForSection:section];
    return questList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestListTableViewCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - Helper Methods

- (NSArray *)questArrayForSection:(NSInteger)section
{
    return self.questMasterArray[section];
}

@end
