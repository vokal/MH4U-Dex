//
//  RegionContainerViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "RegionContainerViewController.h"

#import "Region.h"
#import "RegionItemTableViewController.h"

#import <CoreData/CoreData.h>

#import "CoreDataController.h"

NSString *const RegionNameKey = @"name";

@interface RegionContainerViewController ()

@property (nonatomic, weak) IBOutlet UIView *regionMapSubview;
@property (nonatomic, weak) IBOutlet UIView *regionDropSubview;
@property (nonatomic, weak) IBOutlet UILabel *regionNameLabel;
@property (nonatomic, strong) Region *region;

@end

@implementation RegionContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.regionMapSubview setHidden:YES];
    self.navigationItem.title = [NSString stringWithFormat:@"%@ Low-Rank Items", self.regionName];
    self.regionNameLabel.text = self.regionName;
    CoreDataController *coreDataController = [CoreDataController sharedCDController];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", RegionNameKey, self.regionName];
    self.region = (Region *)[coreDataController getUniqueEntityWithEntityName:[Region entityName] withPredicate:predicate];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedRegionItems"]) {
        RegionItemTableViewController *dropVC = (RegionItemTableViewController *)segue.destinationViewController;
        dropVC.region = self.region;  // This is a much cleaner way to handle these transitions.
    }
}

@end
