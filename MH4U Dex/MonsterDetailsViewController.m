//
//  MonsterDetailsViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterDetailsViewController.h"

#import "Constants.h"

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
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation MonsterDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self segmentedControlChanged:self.segmentedControl];
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    self.overviewSubView.hidden = YES;
    self.lowRankSubView.hidden = YES;
    self.highRankSubView.hidden = YES;
    self.GRankSubView.hidden = YES;
    
    switch (segmentedControl.selectedSegmentIndex) {
        case Overview:
            self.overviewSubView.hidden = NO;
            self.title = [NSString stringWithFormat:@"%@ Overview", self.monster];
            break;
        case LowRank:
            self.lowRankSubView.hidden = NO;
            self.title = [NSString stringWithFormat:@"%@ LR Drops", self.monster];
            break;
        case HighRank:
            self.highRankSubView.hidden = NO;
            self.title = [NSString stringWithFormat:@"%@ HR Drops", self.monster];
            break;
        case GRank:
            self.GRankSubView.hidden = NO;
            self.title = [NSString stringWithFormat:@"%@ GR Drops", self.monster];
            break;
        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"embedOverview"]) {
        MonsterOverviewViewController *overViewVC = (MonsterOverviewViewController *)segue.destinationViewController;
        overViewVC.managedObjectContext = self.managedObjectContext;
        overViewVC.monsterName = self.monster;
    } else {
        MonsterItemTableViewController *itemVC = (MonsterItemTableViewController *)segue.destinationViewController;
        itemVC.managedObjectContext = self.managedObjectContext;
        itemVC.monsterName = self.monster;
        if ([segue.identifier isEqualToString:@"embedLowRank"]) {
            itemVC.rank = LowConstString;
        } else if ([segue.identifier isEqualToString:@"embedHighRank"]) {
            itemVC.rank = HighConstString;
        } else if ([segue.identifier isEqualToString:@"embedGRank"]) {
            itemVC.rank = GConstString;
        }
    }
}

@end
