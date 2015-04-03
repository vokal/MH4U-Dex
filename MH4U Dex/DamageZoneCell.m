//
//  DamageZoneCell.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/9/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "DamageZoneCell.h"

#import "Strings.h"

#import "DamageZone.h"

typedef NS_ENUM(NSInteger, DamageZoneCellOrder) {
    DamageZonePart = 0,
    DamageZoneCut = 1,
    DamageZoneImpact = 2,
    DamageZoneShot = 3,
    DamageZoneKO = 4,
    DamageZoneFire = 5,
    DamageZoneWater =  6,
    DamageZoneIce = 7,
    DamageZoneThunder = 8,
    DamageZoneDragon = 9,
    
    DamageZoneCellOrderCount
};

@interface DamageZoneCell ()

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

@end

@implementation DamageZoneCell

- (void)displayContentsWithDamageZone:(DamageZone *)damageZone atCategory:(NSUInteger)category
{
    self.backgroundColor = [UIColor whiteColor];
    switch (category) {
        case DamageZonePart:
            self.cellLabel.text = damageZone.bodyPart;
            break;
        case DamageZoneCut:
            self.cellLabel.text = [NSString stringWithFormat:@"%@", damageZone.cut];
            break;
        case DamageZoneImpact:
            self.cellLabel.text = [NSString stringWithFormat:@"%@", damageZone.impact];
            break;
        case DamageZoneShot:
            self.cellLabel.text = [NSString stringWithFormat:@"%@", damageZone.shot];
            break;
        case DamageZoneKO:
            //TODO: Replace once KO data is verified.
            self.cellLabel.text = @"??";
            break;
        case DamageZoneFire:
            self.cellLabel.text = [NSString stringWithFormat:@"%@", damageZone.fire];
            self.backgroundColor = [UIColor colorWithRed:1.0
                                                   green:0.0
                                                    blue:0.0
                                                   alpha:[self alphaForElementalIntensity:damageZone.fire]];
            break;
        case DamageZoneWater:
            self.cellLabel.text = [NSString stringWithFormat:@"%@", damageZone.water];
            self.backgroundColor = [UIColor colorWithRed:0.0
                                                   green:0.0
                                                    blue:1.0
                                                   alpha:[self alphaForElementalIntensity:damageZone.water]];
            break;
        case DamageZoneIce:
            self.cellLabel.text = [NSString stringWithFormat:@"%@", damageZone.ice];
            self.backgroundColor = [UIColor colorWithRed:0.0
                                                   green:1.0
                                                    blue:1.0
                                                   alpha:[self alphaForElementalIntensity:damageZone.ice]];
            break;
        case DamageZoneThunder:
            self.cellLabel.text = [NSString stringWithFormat:@"%@", damageZone.thunder];
            self.backgroundColor = [UIColor colorWithRed:1.0
                                                   green:1.0
                                                    blue:0.0
                                                   alpha:[self alphaForElementalIntensity:damageZone.thunder]];
            break;
        case DamageZoneDragon:
            self.cellLabel.text = [NSString stringWithFormat:@"%@", damageZone.dragon];
            self.backgroundColor = [UIColor colorWithRed:1.0
                                                   green:0.0
                                                    blue:1.0
                                                   alpha:[self alphaForElementalIntensity:damageZone.dragon]];
            break;
    }
}

- (CGFloat)alphaForElementalIntensity:(NSNumber *)intensity
{
    CGFloat alpha = [intensity floatValue] / 100.0f;
    if (alpha < 0.05f) {
        alpha = 0.05f;
    } else if (alpha > 1.0f) {
        alpha = 1.0f;
    }
    return alpha;
}

- (void)displayHeaderContentsAtIndexPath:(NSIndexPath *)indexPath
{
    self.backgroundColor = [UIColor whiteColor];
    switch (indexPath.row) {
        case DamageZonePart:
            self.cellLabel.text = [Strings MHDBodyPartLabelText];
            break;
        case DamageZoneCut:
            self.cellLabel.text = [Strings MHDCutLabelText];
            break;
        case DamageZoneImpact:
            self.cellLabel.text = [Strings MHDImpactLabelText];
            break;
        case DamageZoneShot:
            self.cellLabel.text = [Strings MHDShotLabelText];
            break;
        case DamageZoneKO:
            self.cellLabel.text = [Strings MHDKOLabelText];
            break;
        case DamageZoneFire:
            self.cellLabel.text = [Strings MHDFireLabelText];
            break;
        case DamageZoneWater:
            self.cellLabel.text = [Strings MHDWaterLabelText];
            break;
        case DamageZoneIce:
            self.cellLabel.text = [Strings MHDIceLabelText];
            break;
        case DamageZoneThunder:
            self.cellLabel.text = [Strings MHDThunderLabelText];
            break;
        case DamageZoneDragon:
            self.cellLabel.text = [Strings MHDDragonLabelText];
            break;
    }
}

@end
