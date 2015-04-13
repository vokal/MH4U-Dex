//
//  QuestContainerViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 4/13/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "QuestContainerViewController.h"

#import "Constants.h"

#import "Quest.h"

#import "QuestDetailsTableViewController.h"

typedef NS_ENUM(NSInteger, QuestContainerSegmentedControlPage) {
    Details = 0,
    Rewards = 1,
    
    SegmentedControlPageCount
};

@interface QuestContainerViewController ()

@property (nonatomic, weak) IBOutlet UIView *detailsSubView;
@property (nonatomic, weak) IBOutlet UIView *rewardsSubView;

@end

@implementation QuestContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = self.quest.name;
    self.rewardsSubView.hidden = YES;
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case Details:
            self.detailsSubView.hidden = NO;
            self.rewardsSubView.hidden = YES;
            break;
        case Rewards:
            self.detailsSubView.hidden = YES;
            self.rewardsSubView.hidden = NO;
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:MHDSegueIdentifier.embedQuestDetails]) {
        QuestDetailsTableViewController *detailVC = (QuestDetailsTableViewController *)segue.destinationViewController;
        detailVC.quest = self.quest;
    }
}

@end
