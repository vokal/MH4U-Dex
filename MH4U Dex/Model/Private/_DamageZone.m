// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DamageZone.m instead.

#import "_DamageZone.h"

const struct DamageZoneAttributes DamageZoneAttributes = {
	.bodyPart = @"bodyPart",
	.cut = @"cut",
	.dragon = @"dragon",
	.fire = @"fire",
	.ice = @"ice",
	.id = @"id",
	.impact = @"impact",
	.ko = @"ko",
	.shot = @"shot",
	.thunder = @"thunder",
	.water = @"water",
};

const struct DamageZoneRelationships DamageZoneRelationships = {
	.monster = @"monster",
};

@implementation DamageZoneID
@end

@implementation _DamageZone

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DamageZone" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DamageZone";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DamageZone" inManagedObjectContext:moc_];
}

- (DamageZoneID*)objectID {
	return (DamageZoneID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"cutValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cut"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"dragonValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dragon"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"fireValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fire"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"iceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"impactValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"impact"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"koValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ko"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"shotValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"shot"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"thunderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"thunder"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"waterValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"water"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic bodyPart;

@dynamic cut;

- (int16_t)cutValue {
	NSNumber *result = [self cut];
	return [result shortValue];
}

- (void)setCutValue:(int16_t)value_ {
	[self setCut:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveCutValue {
	NSNumber *result = [self primitiveCut];
	return [result shortValue];
}

- (void)setPrimitiveCutValue:(int16_t)value_ {
	[self setPrimitiveCut:[NSNumber numberWithShort:value_]];
}

@dynamic dragon;

- (int16_t)dragonValue {
	NSNumber *result = [self dragon];
	return [result shortValue];
}

- (void)setDragonValue:(int16_t)value_ {
	[self setDragon:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveDragonValue {
	NSNumber *result = [self primitiveDragon];
	return [result shortValue];
}

- (void)setPrimitiveDragonValue:(int16_t)value_ {
	[self setPrimitiveDragon:[NSNumber numberWithShort:value_]];
}

@dynamic fire;

- (int16_t)fireValue {
	NSNumber *result = [self fire];
	return [result shortValue];
}

- (void)setFireValue:(int16_t)value_ {
	[self setFire:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFireValue {
	NSNumber *result = [self primitiveFire];
	return [result shortValue];
}

- (void)setPrimitiveFireValue:(int16_t)value_ {
	[self setPrimitiveFire:[NSNumber numberWithShort:value_]];
}

@dynamic ice;

- (int16_t)iceValue {
	NSNumber *result = [self ice];
	return [result shortValue];
}

- (void)setIceValue:(int16_t)value_ {
	[self setIce:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIceValue {
	NSNumber *result = [self primitiveIce];
	return [result shortValue];
}

- (void)setPrimitiveIceValue:(int16_t)value_ {
	[self setPrimitiveIce:[NSNumber numberWithShort:value_]];
}

@dynamic id;

- (int16_t)idValue {
	NSNumber *result = [self id];
	return [result shortValue];
}

- (void)setIdValue:(int16_t)value_ {
	[self setId:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIdValue {
	NSNumber *result = [self primitiveId];
	return [result shortValue];
}

- (void)setPrimitiveIdValue:(int16_t)value_ {
	[self setPrimitiveId:[NSNumber numberWithShort:value_]];
}

@dynamic impact;

- (int16_t)impactValue {
	NSNumber *result = [self impact];
	return [result shortValue];
}

- (void)setImpactValue:(int16_t)value_ {
	[self setImpact:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveImpactValue {
	NSNumber *result = [self primitiveImpact];
	return [result shortValue];
}

- (void)setPrimitiveImpactValue:(int16_t)value_ {
	[self setPrimitiveImpact:[NSNumber numberWithShort:value_]];
}

@dynamic ko;

- (int16_t)koValue {
	NSNumber *result = [self ko];
	return [result shortValue];
}

- (void)setKoValue:(int16_t)value_ {
	[self setKo:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveKoValue {
	NSNumber *result = [self primitiveKo];
	return [result shortValue];
}

- (void)setPrimitiveKoValue:(int16_t)value_ {
	[self setPrimitiveKo:[NSNumber numberWithShort:value_]];
}

@dynamic shot;

- (int16_t)shotValue {
	NSNumber *result = [self shot];
	return [result shortValue];
}

- (void)setShotValue:(int16_t)value_ {
	[self setShot:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveShotValue {
	NSNumber *result = [self primitiveShot];
	return [result shortValue];
}

- (void)setPrimitiveShotValue:(int16_t)value_ {
	[self setPrimitiveShot:[NSNumber numberWithShort:value_]];
}

@dynamic thunder;

- (int16_t)thunderValue {
	NSNumber *result = [self thunder];
	return [result shortValue];
}

- (void)setThunderValue:(int16_t)value_ {
	[self setThunder:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveThunderValue {
	NSNumber *result = [self primitiveThunder];
	return [result shortValue];
}

- (void)setPrimitiveThunderValue:(int16_t)value_ {
	[self setPrimitiveThunder:[NSNumber numberWithShort:value_]];
}

@dynamic water;

- (int16_t)waterValue {
	NSNumber *result = [self water];
	return [result shortValue];
}

- (void)setWaterValue:(int16_t)value_ {
	[self setWater:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveWaterValue {
	NSNumber *result = [self primitiveWater];
	return [result shortValue];
}

- (void)setPrimitiveWaterValue:(int16_t)value_ {
	[self setPrimitiveWater:[NSNumber numberWithShort:value_]];
}

@dynamic monster;

@end

