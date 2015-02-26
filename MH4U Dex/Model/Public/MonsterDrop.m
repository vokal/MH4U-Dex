#import "MonsterDrop.h"

@interface MonsterDrop ()

@end

@implementation MonsterDrop

- (void)setDropBasicValuesWithID:(NSNumber *)dropID method:(NSString *)method quantity:(NSNumber *)quantity
{
    self.id = dropID;
    self.method = method;
    self.quantity = quantity;
}

@end
