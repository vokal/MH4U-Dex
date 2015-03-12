// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Region.h instead.

#import <CoreData/CoreData.h>

extern const struct RegionAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *keyName;
	__unsafe_unretained NSString *name;
} RegionAttributes;

extern const struct RegionRelationships {
	__unsafe_unretained NSString *area;
} RegionRelationships;

@class Area;

@interface RegionID : NSManagedObjectID {}
@end

@interface _Region : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RegionID* objectID;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* keyName;

//- (BOOL)validateKeyName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *area;

- (NSMutableSet*)areaSet;

@end

@interface _Region (AreaCoreDataGeneratedAccessors)
- (void)addArea:(NSSet*)value_;
- (void)removeArea:(NSSet*)value_;
- (void)addAreaObject:(Area*)value_;
- (void)removeAreaObject:(Area*)value_;

@end

@interface _Region (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (NSString*)primitiveKeyName;
- (void)setPrimitiveKeyName:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveArea;
- (void)setPrimitiveArea:(NSMutableSet*)value;

@end
