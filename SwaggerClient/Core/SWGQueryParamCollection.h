#import <Foundation/Foundation.h>

/**
* SMS Fusion API
* This is the SMS Fusion API
*
* OpenAPI spec version: 1.0.0
* Contact: support@smsfusion.com.au
*
* NOTE: This class is auto generated by the swagger code generator program.
* https://github.com/swagger-api/swagger-codegen.git
* Do not edit the class manually.
*/


@interface SWGQueryParamCollection : NSObject

@property(nonatomic, readonly) NSArray* values;
@property(nonatomic, readonly) NSString* format;

- (id) initWithValuesAndFormat: (NSArray*) values
                        format: (NSString*) format;

@end
