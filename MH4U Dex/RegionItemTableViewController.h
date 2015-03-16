//
//  RegionItemTableViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Region.h"

@interface RegionItemTableViewController : UITableViewController

@property (nonatomic, strong) Region *region;
@property (nonatomic, strong) NSString *rank;

@end
