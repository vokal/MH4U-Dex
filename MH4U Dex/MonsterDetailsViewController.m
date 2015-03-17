//
//  MonsterDetailsViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterDetailsViewController.h"

#import "MonsterItemTableViewController.h"
#import "MonsterOverviewViewController.h"

typedef NS_ENUM(NSInteger, MonsterSegmentedControlPage) {
    Overview = 0,
    LowRank = 1,
    HighRank = 2,
    GRank = 3,
    
    MonsterSegmentedControlCount
};

@interface MonsterDetailsViewController ()

@property (nonatomic, weak) IBOutlet UIView *overviewSubView;
@property (nonatomic, weak) IBOutlet UIView *lowRankSubView;
@property (nonatomic, weak) IBOutlet UIView *highRankSubView;
@property (nonatomic, weak) IBOutlet UIView *GRankSubView;

@end

@implementation MonsterDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.overviewSubView.hidden = NO;
    self.lowRankSubView.hidden = YES;
    self.highRankSubView.hidden = YES;
    self.GRankSubView.hidden = YES;
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case Overview:
            self.overviewSubView.hidden = NO;
            self.lowRankSubView.hidden = YES;
            self.highRankSubView.hidden = YES;
            self.GRankSubView.hidden = YES;
            self.navigationItem.title = [NSString stringWithFormat:@"%@ Overview", self.monster];
            break;
        case LowRank:
            self.overviewSubView.hidden = YES;
            self.lowRankSubView.hidden = NO;
            self.highRankSubView.hidden = YES;
            self.GRankSubView.hidden = YES;
            self.navigationItem.title = [NSString stringWithFormat:@"%@ LR Drops", self.monster];
            break;
        case HighRank:
            self.overviewSubView.hidden = YES;
            self.lowRankSubView.hidden = YES;
            self.highRankSubView.hidden = NO;
            self.GRankSubView.hidden = YES;
        case GRank:
            self.overviewSubView.hidden = YES;
            self.lowRankSubView.hidden = YES;
            self.highRankSubView.hidden = YES;
            self.GRankSubView.hidden = NO;
        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedLowRank"]) {
        MonsterItemTableViewController *lowRankVC = (MonsterItemTableViewController *)segue.destinationViewController;
        lowRankVC.managedObjectContext = self.managedObjectContext;
        lowRankVC.monster = self.monster;
        lowRankVC.rank = @"Low";
    } else if ([segue.identifier isEqualToString:@"embedHighRank"]) {
        MonsterItemTableViewController *highRankVC = (MonsterItemTableViewController *)segue.destinationViewController;
        highRankVC.managedObjectContext = self.managedObjectContext;
        highRankVC.monster = self.monster;
        highRankVC.rank = @"High";
    } else if ([segue.identifier isEqualToString:@"embedGRank"]) {
        MonsterItemTableViewController *GRankVC = (MonsterItemTableViewController *)segue.destinationViewController;
        GRankVC.managedObjectContext = self.managedObjectContext;
        GRankVC.monster = self.monster;
        GRankVC.rank = @"G";
    } else if ([segue.identifier isEqualToString:@"embedOverview"]) {
        MonsterOverviewViewController *overViewVC = (MonsterOverviewViewController *)segue.destinationViewController;
        overViewVC.managedObjectContext = self.managedObjectContext;
        overViewVC.monster = self.monster;
    }
}

@end
