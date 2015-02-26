//
//  HomeViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/5/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface HomeViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

