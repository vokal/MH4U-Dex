// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quest.h instead.

#import <CoreData/CoreData.h>

extern const struct QuestAttributes {
	__unsafe_unretained NSString *name;
} QuestAttributes;

@interface QuestID : NSManagedObjectID {}
@end

@interface _Quest : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) QuestID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@end

@interface _Quest (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

@end
