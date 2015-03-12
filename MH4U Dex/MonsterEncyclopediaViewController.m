//
//  MonsterEncyclopediaViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterEncyclopediaViewController.h"

#import <CoreData/CoreData.h>

#import "MonsterEncyclopediaCell.h"
#import "Monster.h"
#import "MonsterOverviewViewController.h"
#import "MonsterDetailsViewController.h"

typedef NS_ENUM(NSInteger, MonsterEncyclopediaSections) {
    SmallMonsterSection = 0,
    LargeMonsterSection = 1,
    
    MonsterEncyclopediaSectionCount
};

@interface MonsterEncyclopediaViewController ()

@property (nonatomic, strong) NSArray *smallMonsters;
@property (nonatomic, strong) NSArray *largeMonsters;

@end

@implementation MonsterEncyclopediaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Monster entityName]];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"sort_name" ascending:YES];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"monster_class", @"Minion"];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    self.smallMonsters = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching small monster data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"monster_class", @"Boss"];
    [fetchRequest setPredicate:predicate];
    self.largeMonsters = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching large monster data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMonsterDetails"]) {
        MonsterDetailsViewController *detailVC = (MonsterDetailsViewController *)segue.destinationViewController;
        detailVC.managedObjectContext = self.managedObjectContext;
        detailVC.monster = [sender monsterName];
    }
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return MonsterEncyclopediaSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case SmallMonsterSection:
            return self.smallMonsters.count;
        case LargeMonsterSection:
            return self.largeMonsters.count;
        default:
            return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MonsterEncyclopediaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MonsterEncyclopediaCell class])
                                                                              forIndexPath:indexPath];
    Monster *monster;
    switch (indexPath.section) {
        case SmallMonsterSection:
            monster = (Monster *)self.smallMonsters[indexPath.row];
            break;
        case LargeMonsterSection:
            monster = (Monster *)self.largeMonsters[indexPath.row];
            break;
    }
    cell.monsterName = monster.name;
    [cell displayContents];
    return cell;
}

@end
