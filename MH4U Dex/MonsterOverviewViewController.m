//
//  MonsterOverviewViewController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "MonsterOverviewViewController.h"

#import "DamageZonesCollectionViewController.h"

#import "Monster.h"

@interface MonsterOverviewViewController ()

@property (weak, nonatomic) IBOutlet UIView *damageZonesCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *monsterIconImage;
@property (weak, nonatomic) IBOutlet UILabel *monsterNameLabel;

@end

@implementation MonsterOverviewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.monsterNameLabel.text = self.monster.monster_description;
    NSString *imageName = [NSString stringWithFormat:@"%@-icon", [self.monster.name lowercaseString]];
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        self.monsterIconImage.image = image;
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedDamageZones"]) {
        DamageZonesCollectionViewController *damageVC = (DamageZonesCollectionViewController *)segue.destinationViewController;
        damageVC.monster = self.monster;
    }
}

@end
