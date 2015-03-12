// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Trade.m instead.

#import "_Trade.h"

const struct TradeAttributes TradeAttributes = {
	.name = @"name",
};

const struct TradeRelationships TradeRelationships = {
	.tradeIn = @"tradeIn",
	.tradeOut = @"tradeOut",
};

@implementation TradeID
@end

@implementation _Trade

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Trade" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Trade";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Trade" inManagedObjectContext:moc_];
}

- (TradeID*)objectID {
	return (TradeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic tradeIn;

@dynamic tradeOut;

@end

