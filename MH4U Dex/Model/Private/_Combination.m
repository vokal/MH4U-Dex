// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Combination.m instead.

#import "_Combination.h"

const struct CombinationAttributes CombinationAttributes = {
	.name = @"name",
};

const struct CombinationRelationships CombinationRelationships = {
	.firstItem = @"firstItem",
	.secondItem = @"secondItem",
	.thirdItem = @"thirdItem",
};

@implementation CombinationID
@end

@implementation _Combination

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Combination" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Combination";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Combination" inManagedObjectContext:moc_];
}

- (CombinationID*)objectID {
	return (CombinationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic firstItem;

@dynamic secondItem;

@dynamic thirdItem;

@end

