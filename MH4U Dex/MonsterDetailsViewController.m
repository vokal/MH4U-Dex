//
//  MonsterDetailsViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterDetailsViewController.h"
#import "MonsterOverviewViewController.h"
#import "MonsterLowRankTableViewController.h"

typedef NS_ENUM(NSInteger, MonsterSegmentedControlPage) {
    Overview = 0,
    LowRank = 1,
    
    MonsterSegmentedControlCount
};

@interface MonsterDetailsViewController ()

@property (nonatomic, weak) IBOutlet UIView *overviewSubView;
@property (nonatomic, weak) IBOutlet UIView *lowRankSubView;

@end

@implementation MonsterDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.lowRankSubView setHidden:YES];
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case Overview:
            [self.overviewSubView setHidden:NO];
            [self.lowRankSubView setHidden:YES];
            self.navigationItem.title = [NSString stringWithFormat:@"%@ Overview", self.monster];
            break;
        case LowRank:
            [self.overviewSubView setHidden:YES];
            [self.lowRankSubView setHidden:NO];
            self.navigationItem.title = [NSString stringWithFormat:@"%@ LR Drops", self.monster];
            break;
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Test");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedLowRank"]) {
        MonsterLowRankTableViewController *lowRankVC = (MonsterLowRankTableViewController *)segue.destinationViewController;
        lowRankVC.managedObjectContext = self.managedObjectContext;
        lowRankVC.monster = self.monster;
    } else if ([segue.identifier isEqualToString:@"embedOverview"]) {
        MonsterOverviewViewController *overViewVC = (MonsterOverviewViewController *)segue.destinationViewController;
        overViewVC.managedObjectContext = self.managedObjectContext;
        overViewVC.monster = self.monster;
    }
}

@end
