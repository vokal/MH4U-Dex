// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Weapon.h instead.

#import <CoreData/CoreData.h>

extern const struct WeaponAttributes {
	__unsafe_unretained NSString *name;
} WeaponAttributes;

extern const struct WeaponRelationships {
	__unsafe_unretained NSString *material;
} WeaponRelationships;

@class Item;

@interface WeaponID : NSManagedObjectID {}
@end

@interface _Weapon : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WeaponID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *material;

- (NSMutableSet*)materialSet;

@end

@interface _Weapon (MaterialCoreDataGeneratedAccessors)
- (void)addMaterial:(NSSet*)value_;
- (void)removeMaterial:(NSSet*)value_;
- (void)addMaterialObject:(Item*)value_;
- (void)removeMaterialObject:(Item*)value_;

@end

@interface _Weapon (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveMaterial;
- (void)setPrimitiveMaterial:(NSMutableSet*)value;

@end
