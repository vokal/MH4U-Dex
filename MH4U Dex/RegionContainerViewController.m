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

#import "RegionItemTableViewController.h"

#import "Region.h"

typedef NS_ENUM(NSInteger, RegionSegmentedControlPage) {
    LowRank = 0,
    HighRank = 1,
    GRank = 2,
    Map = 3,
    
    MonsterSegmentedControlCount
};

@interface RegionContainerViewController ()

@property (nonatomic, weak) IBOutlet UIView *regionLowRankSubview;
@property (nonatomic, weak) IBOutlet UIView *regionHighRankSubview;
@property (nonatomic, weak) IBOutlet UIView *regionGRankSubview;
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
    self.navigationItem.title = [NSString stringWithFormat:@"%@ Low-Rank Items", self.regionName];
    self.regionNameLabel.text = self.regionName;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RegionItemTableViewController *dropVC = (RegionItemTableViewController *)segue.destinationViewController;
    dropVC.region = self.region;  // This is a much cleaner way to handle these transitions.
    
    if ([segue.identifier isEqualToString:@"embedLowRankRegionItems"]) {
        dropVC.rank = LowConstString;
    } else if ([segue.identifier isEqualToString:@"embedHighRankRegionItems"]) {
        dropVC.rank = HighConstString;
    } else if ([segue.identifier isEqualToString:@"embedGRankRegionItems"]) {
        dropVC.rank = GConstString;
    }
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case LowRank:
            self.regionLowRankSubview.hidden = NO;
            self.regionHighRankSubview.hidden = YES;
            self.regionGRankSubview.hidden = YES;
            break;
        case HighRank:
            self.regionLowRankSubview.hidden = YES;
            self.regionHighRankSubview.hidden = NO;
            self.regionGRankSubview.hidden = YES;
            break;
        case GRank:
            self.regionLowRankSubview.hidden = YES;
            self.regionHighRankSubview.hidden = YES;
            self.regionGRankSubview.hidden = NO;
    }
}

@end
