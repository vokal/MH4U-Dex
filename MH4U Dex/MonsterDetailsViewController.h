//
//  MonsterDetailsViewController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonsterDetailsViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSString *monster;

@end
