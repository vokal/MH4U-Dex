//
//  MonsterEncyclopediaViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterEncyclopediaViewController.h"

#import <CoreData/CoreData.h>

#import "Constants.h"
#import "CoreDataController.h"

#import "MonsterContainerViewController.h"
#import "MonsterOverviewViewController.h"

#import "Monster.h"

#import "MonsterEncyclopediaCell.h"

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
    NSManagedObjectContext *managedObjectContext = [CoreDataController sharedCDController].managedObjectContext;
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Monster entityName]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.monster_class, MHDMinion];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MonsterAttributes.sort_name ascending:YES]];
    self.smallMonsters = [managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching small monster data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.monster_class, MHDBoss];
    self.largeMonsters = [managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching large monster data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMonsterDetails"]) {
        MonsterContainerViewController *detailVC = (MonsterContainerViewController *)segue.destinationViewController;
        if ([sender isMemberOfClass:[MonsterEncyclopediaCell class]]) {
            MonsterEncyclopediaCell *cell = (MonsterEncyclopediaCell *)sender;
            detailVC.monsterName = [self monsterForIndexPath:[self.collectionView indexPathForCell:cell]].name;
        }
    }
}

#pragma mark - Helper Methods

- (Monster *)monsterForIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case SmallMonsterSection:
            return self.smallMonsters[indexPath.row];
        case LargeMonsterSection:
            return self.largeMonsters[indexPath.row];
        default:
            return nil;
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
    [cell displayContentsWithMonster:[self monsterForIndexPath:indexPath]];
    return cell;
}

@end
