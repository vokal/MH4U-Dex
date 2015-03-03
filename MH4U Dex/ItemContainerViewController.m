//
//  ItemContainerViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/19/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "ItemContainerViewController.h"

#import "ItemMonsterSourcesTableViewController.h"
#import "ItemAreaSourcesTableViewController.h"

@interface ItemContainerViewController ()

@property (weak, nonatomic) IBOutlet UIView *monsterSourceSubView;
@property (weak, nonatomic) IBOutlet UIView *areaSourceSubView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;

@end

@implementation ItemContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.areaSourceSubView setHidden:YES];
    self.navigationItem.title = [NSString stringWithFormat:@"%@ Drop Sources", self.itemName];
    self.itemNameLabel.text = self.itemName;
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            self.monsterSourceSubView.hidden = NO;
            self.areaSourceSubView.hidden = YES;
            break;
        case 1:
            self.monsterSourceSubView.hidden = YES;
            self.areaSourceSubView.hidden = NO;
            break;
        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedMonsterSources"]) {
        ItemMonsterSourcesTableViewController *dropVC = (ItemMonsterSourcesTableViewController *)segue.destinationViewController;
        dropVC.managedObjectContext = self.managedObjectContext;
        dropVC.itemName = self.itemName;
    } else if ([segue.identifier isEqualToString:@"embedAreaSources"]) {
        ItemAreaSourcesTableViewController *dropVC = (ItemAreaSourcesTableViewController *)segue.destinationViewController;
        dropVC.managedObjectContext = self.managedObjectContext;
        dropVC.itemName = self.itemName;
    }
}

@end
