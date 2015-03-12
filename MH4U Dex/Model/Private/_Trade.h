// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Trade.h instead.

#import <CoreData/CoreData.h>

extern const struct TradeAttributes {
	__unsafe_unretained NSString *name;
} TradeAttributes;

extern const struct TradeRelationships {
	__unsafe_unretained NSString *tradeIn;
	__unsafe_unretained NSString *tradeOut;
} TradeRelationships;

@class Item;
@class Item;

@interface TradeID : NSManagedObjectID {}
@end

@interface _Trade : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TradeID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Item *tradeIn;

//- (BOOL)validateTradeIn:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Item *tradeOut;

//- (BOOL)validateTradeOut:(id*)value_ error:(NSError**)error_;

@end

@interface _Trade (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (Item*)primitiveTradeIn;
- (void)setPrimitiveTradeIn:(Item*)value;

- (Item*)primitiveTradeOut;
- (void)setPrimitiveTradeOut:(Item*)value;

@end
