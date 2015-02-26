// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.m instead.

#import "_Item.h"

const struct ItemAttributes ItemAttributes = {
	.name = @"name",
};

const struct ItemRelationships ItemRelationships = {
	.areaSource = @"areaSource",
	.armorUse = @"armorUse",
	.comboFirst = @"comboFirst",
	.comboSecond = @"comboSecond",
	.comboThird = @"comboThird",
	.decorationUse = @"decorationUse",
	.monsterSource = @"monsterSource",
	.tradeIn = @"tradeIn",
	.tradeOut = @"tradeOut",
	.weaponUse = @"weaponUse",
};

@implementation ItemID
@end

@implementation _Item

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Item";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Item" inManagedObjectContext:moc_];
}

- (ItemID*)objectID {
	return (ItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic areaSource;

- (NSMutableSet*)areaSourceSet {
	[self willAccessValueForKey:@"areaSource"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"areaSource"];

	[self didAccessValueForKey:@"areaSource"];
	return result;
}

@dynamic armorUse;

- (NSMutableSet*)armorUseSet {
	[self willAccessValueForKey:@"armorUse"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"armorUse"];

	[self didAccessValueForKey:@"armorUse"];
	return result;
}

@dynamic comboFirst;

- (NSMutableSet*)comboFirstSet {
	[self willAccessValueForKey:@"comboFirst"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"comboFirst"];

	[self didAccessValueForKey:@"comboFirst"];
	return result;
}

@dynamic comboSecond;

- (NSMutableSet*)comboSecondSet {
	[self willAccessValueForKey:@"comboSecond"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"comboSecond"];

	[self didAccessValueForKey:@"comboSecond"];
	return result;
}

@dynamic comboThird;

- (NSMutableSet*)comboThirdSet {
	[self willAccessValueForKey:@"comboThird"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"comboThird"];

	[self didAccessValueForKey:@"comboThird"];
	return result;
}

@dynamic decorationUse;

- (NSMutableSet*)decorationUseSet {
	[self willAccessValueForKey:@"decorationUse"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"decorationUse"];

	[self didAccessValueForKey:@"decorationUse"];
	return result;
}

@dynamic monsterSource;

- (NSMutableSet*)monsterSourceSet {
	[self willAccessValueForKey:@"monsterSource"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"monsterSource"];

	[self didAccessValueForKey:@"monsterSource"];
	return result;
}

@dynamic tradeIn;

@dynamic tradeOut;

@dynamic weaponUse;

- (NSMutableSet*)weaponUseSet {
	[self willAccessValueForKey:@"weaponUse"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"weaponUse"];

	[self didAccessValueForKey:@"weaponUse"];
	return result;
}

@end

