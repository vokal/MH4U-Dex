// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AreaDrop.m instead.

#import "_AreaDrop.h"

const struct AreaDropAttributes AreaDropAttributes = {
	.idDecimalString = @"idDecimalString",
	.method = @"method",
	.rank = @"rank",
};

const struct AreaDropRelationships AreaDropRelationships = {
	.area = @"area",
	.item = @"item",
};

@implementation AreaDropID
@end

@implementation _AreaDrop

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"AreaDrop" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"AreaDrop";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"AreaDrop" inManagedObjectContext:moc_];
}

- (AreaDropID*)objectID {
	return (AreaDropID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic idDecimalString;

@dynamic method;

@dynamic rank;

@dynamic area;

@dynamic item;

@end

