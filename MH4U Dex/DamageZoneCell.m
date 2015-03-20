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

@interface DamageZoneCell ()

@property (weak, nonatomic) IBOutlet UILabel *bodyPartLabel;
@property (weak, nonatomic) IBOutlet UILabel *cutLabel;
@property (weak, nonatomic) IBOutlet UILabel *impactLabel;
@property (weak, nonatomic) IBOutlet UILabel *shotLabel;
@property (weak, nonatomic) IBOutlet UILabel *fireLabel;
@property (weak, nonatomic) IBOutlet UILabel *waterLabel;
@property (weak, nonatomic) IBOutlet UILabel *thunderLabel;
@property (weak, nonatomic) IBOutlet UILabel *iceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dragonLabel;
@property (weak, nonatomic) IBOutlet UILabel *koLabel;
@property (weak, nonatomic) IBOutlet UILabel *extractLabel;

@end

@implementation DamageZoneCell

- (void)displayContentsWithDamageZone:(DamageZone *)damageZone
{
    self.bodyPartLabel.text = damageZone.bodyPart;
    self.extractLabel.text = damageZone.extract;
    if ([damageZone.bodyPart isEqualToString:[Strings MHDBodyPartLabelText]]) {
        // This is the template.
        self.cutLabel.text = [Strings MHDCutLabelText];
        self.impactLabel.text = [Strings MHDImpactLabelText];
        self.shotLabel.text = [Strings MHDShotLabelText];
        self.koLabel.text = [Strings MHDKOLabelText];
        self.fireLabel.text = [Strings MHDFireLabelText];
        self.iceLabel.text = [Strings MHDIceLabelText];
        self.dragonLabel.text = [Strings MHDDragonLabelText];
        self.waterLabel.text = [Strings MHDWaterLabelText];
        self.thunderLabel.text = [Strings MHDThunderLabelText];
    } else {
        self.cutLabel.text = [NSString stringWithFormat:@"%@", damageZone.cut];
        self.impactLabel.text = [NSString stringWithFormat:@"%@", damageZone.impact];
        self.shotLabel.text = [NSString stringWithFormat:@"%@", damageZone.shot];
        self.fireLabel.text = [NSString stringWithFormat:@"%@", damageZone.fire];
        self.waterLabel.text = [NSString stringWithFormat:@"%@", damageZone.water];
        self.thunderLabel.text = [NSString stringWithFormat:@"%@", damageZone.thunder];
        self.iceLabel.text = [NSString stringWithFormat:@"%@", damageZone.ice];
        self.dragonLabel.text = [NSString stringWithFormat:@"%@", damageZone.dragon];
        self.koLabel.text = [NSString stringWithFormat:@"%@", damageZone.ko];
    }
}

@end
