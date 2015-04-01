// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Drop.m instead.

#import "_Drop.h"

const struct DropAttributes DropAttributes = {
	.percent = @"percent",
	.quantity = @"quantity",
};

@implementation DropID
@end

@implementation _Drop

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Drop" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Drop";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Drop" inManagedObjectContext:moc_];
}

- (DropID*)objectID {
	return (DropID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

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

@end

