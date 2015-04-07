//
//  HomeViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/5/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "HomeViewController.h"

#import <MBProgressHUD.h>

#import "CoreDataController.h"
#import "Strings.h"

#import "ItemEncyclopediaTableViewController.h"
#import "MonsterEncyclopediaViewController.h"
#import "RegionEncyclopediaCollectionViewController.h"

//TODO: Make sure that all buttons are localized properly.

@interface HomeViewController ()

@end

@implementation HomeViewController

- (IBAction)resetButtonPressed:(id)sender
{
    [CoreDataController setShouldTriggerReloadUponRestart:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [[CoreDataController sharedCDController] tryLoadSequence];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMonsterEncyclopedia"]) {
        MonsterEncyclopediaViewController *monsterVC = (MonsterEncyclopediaViewController *)segue.destinationViewController;
        monsterVC.title = [Strings MHDMonsterEncyclopedia];
    } else if ([segue.identifier isEqualToString:@"showItemEncyclopedia"]) {
        ItemEncyclopediaTableViewController *itemVC = (ItemEncyclopediaTableViewController *)segue.destinationViewController;
        itemVC.navigationItem.title = [Strings MHDItemEncyclopedia];
    } else if ([segue.identifier isEqualToString:@"showRegionEncyclopedia"]) {
        RegionEncyclopediaCollectionViewController *regionVC = (RegionEncyclopediaCollectionViewController *)segue.destinationViewController;
        regionVC.navigationItem.title = [Strings MHDRegionEncyclopedia];
    }
}

@end
