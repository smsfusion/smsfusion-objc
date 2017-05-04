#import "SWGHLRCallback.h"

@implementation SWGHLRCallback

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    
  }
  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"_id": @"id", @"msisdn": @"msisdn", @"status": @"status", @"country": @"country", @"operator": @"operator", @"mccmnc": @"mccmnc", @"duration": @"duration", @"message": @"message", @"extended": @"extended", @"cost": @"cost" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"_id", @"msisdn", @"status", @"country", @"operator", @"mccmnc", @"duration", @"message", @"extended", @"cost"];
  return [optionalProperties containsObject:propertyName];
}

@end
