// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Combination.h instead.

#import <CoreData/CoreData.h>

extern const struct CombinationAttributes {
	__unsafe_unretained NSString *name;
} CombinationAttributes;

extern const struct CombinationRelationships {
	__unsafe_unretained NSString *firstItem;
	__unsafe_unretained NSString *secondItem;
	__unsafe_unretained NSString *thirdItem;
} CombinationRelationships;

@class Item;
@class Item;
@class Item;

@interface CombinationID : NSManagedObjectID {}
@end

@interface _Combination : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CombinationID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Item *firstItem;

//- (BOOL)validateFirstItem:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Item *secondItem;

//- (BOOL)validateSecondItem:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Item *thirdItem;

//- (BOOL)validateThirdItem:(id*)value_ error:(NSError**)error_;

@end

@interface _Combination (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (Item*)primitiveFirstItem;
- (void)setPrimitiveFirstItem:(Item*)value;

- (Item*)primitiveSecondItem;
- (void)setPrimitiveSecondItem:(Item*)value;

- (Item*)primitiveThirdItem;
- (void)setPrimitiveThirdItem:(Item*)value;

@end
