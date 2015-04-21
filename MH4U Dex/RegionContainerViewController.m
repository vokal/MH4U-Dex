//
//  RegionContainerViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "RegionContainerViewController.h"

#import <CoreData/CoreData.h>

#import "Constants.h"
#import "CoreDataController.h"

#import "MonsterQuestsTableViewController.h"
#import "RegionItemTableViewController.h"

#import "Region.h"

typedef NS_ENUM(NSInteger, RegionSegmentedControlPage) {
    LowRank = 0,
    HighRank = 1,
    GRank = 2,
    RegionQuest = 3,
    Map = 4,
    
    RegionSegmentedControlCount
};

@interface RegionContainerViewController ()

@property (nonatomic, weak) IBOutlet UIView *regionLowRankSubview;
@property (nonatomic, weak) IBOutlet UIView *regionHighRankSubview;
@property (nonatomic, weak) IBOutlet UIView *regionGRankSubview;
@property (nonatomic, weak) IBOutlet UIView *regionQuestSubview;
@property (nonatomic, weak) IBOutlet UILabel *regionNameLabel;

@end

@implementation RegionContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //TODO: Uncomment or remove once a solution for map displays is found.
    //[self.regionMapSubview setHidden:YES];
    self.regionLowRankSubview.hidden = NO;
    self.regionHighRankSubview.hidden = YES;
    self.regionGRankSubview.hidden = YES;
    self.regionQuestSubview.hidden = YES;
    self.title = [NSString stringWithFormat:@"%@ Low-Rank Items", self.region.name];
    self.regionNameLabel.text = self.region.name;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RegionItemTableViewController *dropVC = (RegionItemTableViewController *)segue.destinationViewController;
    dropVC.region = self.region;  // This is a much cleaner way to handle these transitions.
    
    if ([segue.identifier isEqualToString:@"embedLowRankRegionItems"]) {
        dropVC.rank = MHDLowConstString;
    } else if ([segue.identifier isEqualToString:@"embedHighRankRegionItems"]) {
        dropVC.rank = MHDHighConstString;
    } else if ([segue.identifier isEqualToString:@"embedGRankRegionItems"]) {
        dropVC.rank = MHDGConstString;
    } else if ([segue.identifier isEqualToString:@"embedRegionQuests"]) {
        MonsterQuestsTableViewController *questVC = (MonsterQuestsTableViewController *)segue.destinationViewController;
        questVC.region = self.region;
        questVC.isMonsterLink = NO;
    }
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case LowRank:
            self.regionLowRankSubview.hidden = NO;
            self.regionHighRankSubview.hidden = YES;
            self.regionGRankSubview.hidden = YES;
            self.regionQuestSubview.hidden = YES;
            self.title = [NSString stringWithFormat:@"%@ Low-Rank Items", self.region.name];
            break;
        case HighRank:
            self.regionLowRankSubview.hidden = YES;
            self.regionHighRankSubview.hidden = NO;
            self.regionGRankSubview.hidden = YES;
            self.regionQuestSubview.hidden = YES;
            self.title = [NSString stringWithFormat:@"%@ High-Rank Items", self.region.name];
            break;
        case GRank:
            self.regionLowRankSubview.hidden = YES;
            self.regionHighRankSubview.hidden = YES;
            self.regionGRankSubview.hidden = NO;
            self.regionQuestSubview.hidden = YES;
            self.title = [NSString stringWithFormat:@"%@ G-Rank Items", self.region.name];
            break;
        case RegionQuest:
            self.regionLowRankSubview.hidden = YES;
            self.regionHighRankSubview.hidden = YES;
            self.regionGRankSubview.hidden = YES;
            self.regionQuestSubview.hidden = NO;
            self.title = [NSString stringWithFormat:@"Quests in %@", self.region.name];
            break;
    }
}

@end
