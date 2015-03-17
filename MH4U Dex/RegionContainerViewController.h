//
//  RegionContainerViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Region;

@interface RegionContainerViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSString *regionKeyName;
@property (nonatomic, strong) NSString *regionName;
@property (nonatomic, strong) Region *region;

@end
