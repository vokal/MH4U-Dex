// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Decoration.h instead.

#import <CoreData/CoreData.h>

extern const struct DecorationAttributes {
	__unsafe_unretained NSString *name;
} DecorationAttributes;

extern const struct DecorationRelationships {
	__unsafe_unretained NSString *material;
	__unsafe_unretained NSString *skilltree;
} DecorationRelationships;

@class Item;
@class Skilltree;

@interface DecorationID : NSManagedObjectID {}
@end

@interface _Decoration : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DecorationID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *material;

- (NSMutableSet*)materialSet;

@property (nonatomic, strong) NSSet *skilltree;

- (NSMutableSet*)skilltreeSet;

@end

@interface _Decoration (MaterialCoreDataGeneratedAccessors)
- (void)addMaterial:(NSSet*)value_;
- (void)removeMaterial:(NSSet*)value_;
- (void)addMaterialObject:(Item*)value_;
- (void)removeMaterialObject:(Item*)value_;

@end

@interface _Decoration (SkilltreeCoreDataGeneratedAccessors)
- (void)addSkilltree:(NSSet*)value_;
- (void)removeSkilltree:(NSSet*)value_;
- (void)addSkilltreeObject:(Skilltree*)value_;
- (void)removeSkilltreeObject:(Skilltree*)value_;

@end

@interface _Decoration (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveMaterial;
- (void)setPrimitiveMaterial:(NSMutableSet*)value;

- (NSMutableSet*)primitiveSkilltree;
- (void)setPrimitiveSkilltree:(NSMutableSet*)value;

@end
