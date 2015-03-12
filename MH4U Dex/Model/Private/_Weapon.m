// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Weapon.m instead.

#import "_Weapon.h"

const struct WeaponAttributes WeaponAttributes = {
	.name = @"name",
};

const struct WeaponRelationships WeaponRelationships = {
	.material = @"material",
};

@implementation WeaponID
@end

@implementation _Weapon

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Weapon" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Weapon";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Weapon" inManagedObjectContext:moc_];
}

- (WeaponID*)objectID {
	return (WeaponID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic material;

- (NSMutableSet*)materialSet {
	[self willAccessValueForKey:@"material"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"material"];

	[self didAccessValueForKey:@"material"];
	return result;
}

@end

