// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Area.h instead.

#import <CoreData/CoreData.h>

extern const struct AreaAttributes {
	__unsafe_unretained NSString *combinedName;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *rank;
} AreaAttributes;

extern const struct AreaRelationships {
	__unsafe_unretained NSString *drop;
	__unsafe_unretained NSString *region;
} AreaRelationships;

@class AreaDrop;
@class Region;

@interface AreaID : NSManagedObjectID {}
@end

@interface _Area : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AreaID* objectID;

@property (nonatomic, strong) NSString* combinedName;

//- (BOOL)validateCombinedName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* rank;

//- (BOOL)validateRank:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *drop;

- (NSMutableSet*)dropSet;

@property (nonatomic, strong) Region *region;

//- (BOOL)validateRegion:(id*)value_ error:(NSError**)error_;

@end

@interface _Area (DropCoreDataGeneratedAccessors)
- (void)addDrop:(NSSet*)value_;
- (void)removeDrop:(NSSet*)value_;
- (void)addDropObject:(AreaDrop*)value_;
- (void)removeDropObject:(AreaDrop*)value_;

@end

@interface _Area (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCombinedName;
- (void)setPrimitiveCombinedName:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveRank;
- (void)setPrimitiveRank:(NSString*)value;

- (NSMutableSet*)primitiveDrop;
- (void)setPrimitiveDrop:(NSMutableSet*)value;

- (Region*)primitiveRegion;
- (void)setPrimitiveRegion:(Region*)value;

@end
