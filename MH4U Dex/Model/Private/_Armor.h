// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Armor.h instead.

#import <CoreData/CoreData.h>

extern const struct ArmorAttributes {
	__unsafe_unretained NSString *maxDefense;
	__unsafe_unretained NSString *minDefense;
	__unsafe_unretained NSString *name;
} ArmorAttributes;

extern const struct ArmorRelationships {
	__unsafe_unretained NSString *material;
	__unsafe_unretained NSString *set;
	__unsafe_unretained NSString *skilltree;
} ArmorRelationships;

@class Item;
@class ArmorSet;
@class Skilltree;

@interface ArmorID : NSManagedObjectID {}
@end

@interface _Armor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ArmorID* objectID;

@property (nonatomic, strong) NSNumber* maxDefense;

@property (atomic) int16_t maxDefenseValue;
- (int16_t)maxDefenseValue;
- (void)setMaxDefenseValue:(int16_t)value_;

//- (BOOL)validateMaxDefense:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* minDefense;

@property (atomic) int16_t minDefenseValue;
- (int16_t)minDefenseValue;
- (void)setMinDefenseValue:(int16_t)value_;

//- (BOOL)validateMinDefense:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *material;

- (NSMutableSet*)materialSet;

@property (nonatomic, strong) ArmorSet *set;

//- (BOOL)validateSet:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *skilltree;

- (NSMutableSet*)skilltreeSet;

@end

@interface _Armor (MaterialCoreDataGeneratedAccessors)
- (void)addMaterial:(NSSet*)value_;
- (void)removeMaterial:(NSSet*)value_;
- (void)addMaterialObject:(Item*)value_;
- (void)removeMaterialObject:(Item*)value_;

@end

@interface _Armor (SkilltreeCoreDataGeneratedAccessors)
- (void)addSkilltree:(NSSet*)value_;
- (void)removeSkilltree:(NSSet*)value_;
- (void)addSkilltreeObject:(Skilltree*)value_;
- (void)removeSkilltreeObject:(Skilltree*)value_;

@end

@interface _Armor (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveMaxDefense;
- (void)setPrimitiveMaxDefense:(NSNumber*)value;

- (int16_t)primitiveMaxDefenseValue;
- (void)setPrimitiveMaxDefenseValue:(int16_t)value_;

- (NSNumber*)primitiveMinDefense;
- (void)setPrimitiveMinDefense:(NSNumber*)value;

- (int16_t)primitiveMinDefenseValue;
- (void)setPrimitiveMinDefenseValue:(int16_t)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveMaterial;
- (void)setPrimitiveMaterial:(NSMutableSet*)value;

- (ArmorSet*)primitiveSet;
- (void)setPrimitiveSet:(ArmorSet*)value;

- (NSMutableSet*)primitiveSkilltree;
- (void)setPrimitiveSkilltree:(NSMutableSet*)value;

@end
