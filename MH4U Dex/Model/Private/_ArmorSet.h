// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ArmorSet.h instead.

#import <CoreData/CoreData.h>

extern const struct ArmorSetAttributes {
	__unsafe_unretained NSString *name;
} ArmorSetAttributes;

extern const struct ArmorSetRelationships {
	__unsafe_unretained NSString *piece;
} ArmorSetRelationships;

@class Armor;

@interface ArmorSetID : NSManagedObjectID {}
@end

@interface _ArmorSet : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ArmorSetID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *piece;

- (NSMutableSet*)pieceSet;

@end

@interface _ArmorSet (PieceCoreDataGeneratedAccessors)
- (void)addPiece:(NSSet*)value_;
- (void)removePiece:(NSSet*)value_;
- (void)addPieceObject:(Armor*)value_;
- (void)removePieceObject:(Armor*)value_;

@end

@interface _ArmorSet (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitivePiece;
- (void)setPrimitivePiece:(NSMutableSet*)value;

@end
