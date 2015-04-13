//
//  QuestEncyclopediaContainerViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/16/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestEncyclopediaContainerViewController.h"

#import "QuestListTableViewController.h"

typedef NS_ENUM(NSInteger, QuestListSegmentedControlPage) {
    CaravanQuests = 0,
    HallQuests = 1,
    
    QuestListPageCount
};

@interface QuestEncyclopediaContainerViewController ()

@property (nonatomic, weak) IBOutlet UIView *caravanSubView;
@property (nonatomic, weak) IBOutlet UIView *hallSubView;

@end

@implementation QuestEncyclopediaContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.hallSubView.hidden = YES;
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case CaravanQuests:
            self.hallSubView.hidden = YES;
            self.caravanSubView.hidden = NO;
            break;
        case HallQuests:
            self.hallSubView.hidden = NO;
            self.caravanSubView.hidden = YES;
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    QuestListTableViewController *questListVC = (QuestListTableViewController *)segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showCaravanList"]) {
        questListVC.isCaravan = YES;
    } else if ([segue.identifier isEqualToString:@"showGatheringHallList"]) {
        questListVC.isCaravan = NO;
    }
}

@end
