// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MonsterDrop.m instead.

#import "_MonsterDrop.h"

const struct MonsterDropAttributes MonsterDropAttributes = {
	.id = @"id",
	.method = @"method",
	.percent = @"percent",
	.quantity = @"quantity",
	.rank = @"rank",
};

const struct MonsterDropRelationships MonsterDropRelationships = {
	.item = @"item",
	.monsterSource = @"monsterSource",
};

@implementation MonsterDropID
@end

@implementation _MonsterDrop

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MonsterDrop" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MonsterDrop";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MonsterDrop" inManagedObjectContext:moc_];
}

- (MonsterDropID*)objectID {
	return (MonsterDropID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"percentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"percent"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"quantityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"quantity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
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

@dynamic method;

@dynamic percent;

- (int16_t)percentValue {
	NSNumber *result = [self percent];
	return [result shortValue];
}

- (void)setPercentValue:(int16_t)value_ {
	[self setPercent:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePercentValue {
	NSNumber *result = [self primitivePercent];
	return [result shortValue];
}

- (void)setPrimitivePercentValue:(int16_t)value_ {
	[self setPrimitivePercent:[NSNumber numberWithShort:value_]];
}

@dynamic quantity;

- (int16_t)quantityValue {
	NSNumber *result = [self quantity];
	return [result shortValue];
}

- (void)setQuantityValue:(int16_t)value_ {
	[self setQuantity:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveQuantityValue {
	NSNumber *result = [self primitiveQuantity];
	return [result shortValue];
}

- (void)setPrimitiveQuantityValue:(int16_t)value_ {
	[self setPrimitiveQuantity:[NSNumber numberWithShort:value_]];
}

@dynamic rank;

@dynamic item;

@dynamic monsterSource;

+ (NSArray*)fetchFetchRequest:(NSManagedObjectContext*)moc_ {
	NSError *error = nil;
	NSArray *result = [self fetchFetchRequest:moc_ error:&error];
	if (error) {
#ifdef NSAppKitVersionNumber10_0
		[NSApp presentError:error];
#else
		NSLog(@"error: %@", error);
#endif
	}
	return result;
}
+ (NSArray*)fetchFetchRequest:(NSManagedObjectContext*)moc_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;

	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];

	NSDictionary *substitutionVariables = [NSDictionary dictionary];

	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"FetchRequest"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"FetchRequest\".");

	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}

@end

