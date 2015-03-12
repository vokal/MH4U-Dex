// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Skilltree.h instead.

#import <CoreData/CoreData.h>

extern const struct SkilltreeAttributes {
	__unsafe_unretained NSString *name;
} SkilltreeAttributes;

extern const struct SkilltreeRelationships {
	__unsafe_unretained NSString *armor;
	__unsafe_unretained NSString *decoration;
} SkilltreeRelationships;

@class Armor;
@class Decoration;

@interface SkilltreeID : NSManagedObjectID {}
@end

@interface _Skilltree : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) SkilltreeID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *armor;

- (NSMutableSet*)armorSet;

@property (nonatomic, strong) NSSet *decoration;

- (NSMutableSet*)decorationSet;

@end

@interface _Skilltree (ArmorCoreDataGeneratedAccessors)
- (void)addArmor:(NSSet*)value_;
- (void)removeArmor:(NSSet*)value_;
- (void)addArmorObject:(Armor*)value_;
- (void)removeArmorObject:(Armor*)value_;

@end

@interface _Skilltree (DecorationCoreDataGeneratedAccessors)
- (void)addDecoration:(NSSet*)value_;
- (void)removeDecoration:(NSSet*)value_;
- (void)addDecorationObject:(Decoration*)value_;
- (void)removeDecorationObject:(Decoration*)value_;

@end

@interface _Skilltree (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveArmor;
- (void)setPrimitiveArmor:(NSMutableSet*)value;

- (NSMutableSet*)primitiveDecoration;
- (void)setPrimitiveDecoration:(NSMutableSet*)value;

@end
