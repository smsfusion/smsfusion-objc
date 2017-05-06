#import "SWGHLRApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGApiClient.h"
#import "SWGHLRCallback.h"
#import "SWGHLRError.h"
#import "SWGHLRResult.h"
#import "SWGOutOfCredit.h"


@interface SWGHLRApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation SWGHLRApi

NSString* kSWGHLRApiErrorDomain = @"SWGHLRApiErrorDomain";
NSInteger kSWGHLRApiMissingParamErrorCode = 234513;

@synthesize apiClient = _apiClient;

#pragma mark - Initialize methods

- (instancetype) init {
    return [self initWithApiClient:[SWGApiClient sharedClient]];
}


-(instancetype) initWithApiClient:(SWGApiClient *)apiClient {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _mutableDefaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

-(NSString*) defaultHeaderForKey:(NSString*)key {
    return self.mutableDefaultHeaders[key];
}

-(void) setDefaultHeaderValue:(NSString*) value forKey:(NSString*)key {
    [self.mutableDefaultHeaders setValue:value forKey:key];
}

-(NSDictionary *)defaultHeaders {
    return self.mutableDefaultHeaders;
}

#pragma mark - Api Methods

///
/// HLR number lookup
/// Perform HLR on number
///  @param key API Key as generated from the <a href='https://www.smsfusion.com.au/admin/api/'>admin panel</a> 
///
///  @param num A single phone number or <a href='https://www.smsfusion.com.au/help/msisdn/'>MSDISDN</a> 
///
///  @param cc 2 character country code <a href='https://en.wikipedia.org/wiki/ISO_3166-2'>ISO 3166-2</a> for formatting local numbers internationally (optional)
///
///  @returns SWGHLRCallback*
///
-(NSURLSessionTask*) getHLRWithKey: (NSString*) key
    num: (NSString*) num
    cc: (NSString*) cc
    completionHandler: (void (^)(SWGHLRCallback* output, NSError* error)) handler {
    // verify the required parameter 'key' is set
    if (key == nil) {
        NSParameterAssert(key);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"key"] };
            NSError* error = [NSError errorWithDomain:kSWGHLRApiErrorDomain code:kSWGHLRApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'num' is set
    if (num == nil) {
        NSParameterAssert(num);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"num"] };
            NSError* error = [NSError errorWithDomain:kSWGHLRApiErrorDomain code:kSWGHLRApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/hlr/"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (key != nil) {
        queryParams[@"key"] = key;
    }
    if (num != nil) {
        queryParams[@"num"] = num;
    }
    if (cc != nil) {
        queryParams[@"cc"] = cc;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"api_key"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGHLRCallback*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGHLRCallback*)data, error);
                                }
                            }];
}

///
/// HLR number lookup with results going to a callback URL
/// Perform HLR on number with the result being sent to the callback URL provided
///  @param key API Key as generated from the <a href='https://www.smsfusion.com.au/admin/api/'>admin panel</a> 
///
///  @param num Comma separated list of phone numbers or <a href='https://www.smsfusion.com.au/help/msisdn/'>MSDISDN</a>'s 
///
///  @param cb HTTP or HTTPS callback URL for each result. The result will be sent as POST with a json object included in <b>result</b>. Timeout for callbacks is set to 30 seconds 
///
///  @param cc 2 character country code <a href='https://en.wikipedia.org/wiki/ISO_3166-2'>ISO 3166-2</a> for formatting local numbers internationally (optional)
///
///  @returns SWGHLRResult*
///
-(NSURLSessionTask*) getHLRCallbackWithKey: (NSString*) key
    num: (NSArray<NSString*>*) num
    cb: (NSString*) cb
    cc: (NSString*) cc
    completionHandler: (void (^)(SWGHLRResult* output, NSError* error)) handler {
    // verify the required parameter 'key' is set
    if (key == nil) {
        NSParameterAssert(key);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"key"] };
            NSError* error = [NSError errorWithDomain:kSWGHLRApiErrorDomain code:kSWGHLRApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'num' is set
    if (num == nil) {
        NSParameterAssert(num);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"num"] };
            NSError* error = [NSError errorWithDomain:kSWGHLRApiErrorDomain code:kSWGHLRApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'cb' is set
    if (cb == nil) {
        NSParameterAssert(cb);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"cb"] };
            NSError* error = [NSError errorWithDomain:kSWGHLRApiErrorDomain code:kSWGHLRApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/hlr-callback/"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (key != nil) {
        queryParams[@"key"] = key;
    }
    if (num != nil) {
        queryParams[@"num"] = [[SWGQueryParamCollection alloc] initWithValuesAndFormat: num format: @"csv"];
        
    }
    if (cb != nil) {
        queryParams[@"cb"] = cb;
    }
    if (cc != nil) {
        queryParams[@"cc"] = cc;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"api_key"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGHLRResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGHLRResult*)data, error);
                                }
                            }];
}



@end
