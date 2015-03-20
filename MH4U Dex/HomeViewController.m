//
//  HomeViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/5/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "HomeViewController.h"

#import "Strings.h"

#import "ItemEncyclopediaTableViewController.h"
#import "MonsterEncyclopediaViewController.h"
#import "RegionEncyclopediaCollectionViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMonsterEncyclopedia"]) {
        MonsterEncyclopediaViewController *monsterVC = (MonsterEncyclopediaViewController *)segue.destinationViewController;
        monsterVC.managedObjectContext = self.managedObjectContext;
        monsterVC.navigationItem.title = [Strings MHDMonsterEncyclopedia];
    } else if ([segue.identifier isEqualToString:@"showItemEncyclopedia"]) {
        ItemEncyclopediaTableViewController *itemVC = (ItemEncyclopediaTableViewController *)segue.destinationViewController;
        itemVC.managedObjectContext = self.managedObjectContext;
        itemVC.navigationItem.title = [Strings MHDItemEncyclopedia];
    } else if ([segue.identifier isEqualToString:@"showRegionEncyclopedia"]) {
        RegionEncyclopediaCollectionViewController *regionVC = (RegionEncyclopediaCollectionViewController *)segue.destinationViewController;
        regionVC.managedObjectContext = self.managedObjectContext;
        regionVC.navigationItem.title = [Strings MHDRegionEncyclopedia];
    }
}

@end
