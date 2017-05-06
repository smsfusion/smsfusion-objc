#import "SWGSMSApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGApiClient.h"
#import "SWGHLRError.h"
#import "SWGOutOfCredit.h"
#import "SWGSMSResult.h"


@interface SWGSMSApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation SWGSMSApi

NSString* kSWGSMSApiErrorDomain = @"SWGSMSApiErrorDomain";
NSInteger kSWGSMSApiMissingParamErrorCode = 234513;

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
/// Send an SMS
/// Send one or more SMS
///  @param key API Key as generated from the <a href='https://www.smsfusion.com.au/admin/api/'>admin panel</a> 
///
///  @param num Comma separated list of phone numbers or <a href='https://www.smsfusion.com.au/help/msisdn/'>MSDISDN</a>'s 
///
///  @param msg Message content to send 
///
///  @param from MSISDN or vanity alphanumeric source number (optional)
///
///  @param deliverby UTC encoded time to send the SMS (optional)
///
///  @param dlrcb HTTP or HTTPS callback URL for delivery reports. Timeout for callbacks is set to 30 seconds (optional)
///
///  @param replycb HTTP or HTTPS callback URL for replies. Timeout for callbacks is set to 30 seconds (optional)
///
///  @param replyemail Email address to send replies to (optional)
///
///  @param validity Time in minutes to keep the SMS valid for (optional)
///
///  @param cc 2 character country code <a href='https://en.wikipedia.org/wiki/ISO_3166-2'>ISO 3166-2</a> for formatting local numbers internationally (optional)
///
///  @returns SWGSMSResult*
///
-(NSURLSessionTask*) sendSMSWithKey: (NSString*) key
    num: (NSArray<NSString*>*) num
    msg: (NSString*) msg
    from: (NSString*) from
    deliverby: (NSString*) deliverby
    dlrcb: (NSString*) dlrcb
    replycb: (NSString*) replycb
    replyemail: (NSString*) replyemail
    validity: (NSNumber*) validity
    cc: (NSString*) cc
    completionHandler: (void (^)(SWGSMSResult* output, NSError* error)) handler {
    // verify the required parameter 'key' is set
    if (key == nil) {
        NSParameterAssert(key);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"key"] };
            NSError* error = [NSError errorWithDomain:kSWGSMSApiErrorDomain code:kSWGSMSApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'num' is set
    if (num == nil) {
        NSParameterAssert(num);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"num"] };
            NSError* error = [NSError errorWithDomain:kSWGSMSApiErrorDomain code:kSWGSMSApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'msg' is set
    if (msg == nil) {
        NSParameterAssert(msg);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"msg"] };
            NSError* error = [NSError errorWithDomain:kSWGSMSApiErrorDomain code:kSWGSMSApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/sms/"];

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
    if (msg != nil) {
        queryParams[@"msg"] = msg;
    }
    if (from != nil) {
        queryParams[@"from"] = from;
    }
    if (deliverby != nil) {
        queryParams[@"deliverby"] = deliverby;
    }
    if (dlrcb != nil) {
        queryParams[@"dlrcb"] = dlrcb;
    }
    if (replycb != nil) {
        queryParams[@"replycb"] = replycb;
    }
    if (replyemail != nil) {
        queryParams[@"replyemail"] = replyemail;
    }
    if (validity != nil) {
        queryParams[@"validity"] = validity;
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
                              responseType: @"SWGSMSResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGSMSResult*)data, error);
                                }
                            }];
}



@end
