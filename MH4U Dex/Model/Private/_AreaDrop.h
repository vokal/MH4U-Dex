// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AreaDrop.h instead.

#import <CoreData/CoreData.h>
#import "Drop.h"

extern const struct AreaDropAttributes {
	__unsafe_unretained NSString *idDecimalString;
	__unsafe_unretained NSString *method;
	__unsafe_unretained NSString *rank;
} AreaDropAttributes;

extern const struct AreaDropRelationships {
	__unsafe_unretained NSString *area;
	__unsafe_unretained NSString *item;
} AreaDropRelationships;

@class Area;
@class Item;

@interface AreaDropID : DropID {}
@end

@interface _AreaDrop : Drop {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AreaDropID* objectID;

@property (nonatomic, strong) NSString* idDecimalString;

//- (BOOL)validateIdDecimalString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* method;

//- (BOOL)validateMethod:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* rank;

//- (BOOL)validateRank:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Area *area;

//- (BOOL)validateArea:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Item *item;

//- (BOOL)validateItem:(id*)value_ error:(NSError**)error_;

@end

@interface _AreaDrop (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveIdDecimalString;
- (void)setPrimitiveIdDecimalString:(NSString*)value;

- (NSString*)primitiveMethod;
- (void)setPrimitiveMethod:(NSString*)value;

- (NSString*)primitiveRank;
- (void)setPrimitiveRank:(NSString*)value;

- (Area*)primitiveArea;
- (void)setPrimitiveArea:(Area*)value;

- (Item*)primitiveItem;
- (void)setPrimitiveItem:(Item*)value;

@end
