#import <Foundation/Foundation.h>
#import "SWGHLRError.h"
#import "SWGOutOfCredit.h"
#import "SWGSMSResult.h"
#import "SWGApi.h"

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



@interface SWGSMSApi: NSObject <SWGApi>

extern NSString* kSWGSMSApiErrorDomain;
extern NSInteger kSWGSMSApiMissingParamErrorCode;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient NS_DESIGNATED_INITIALIZER;

/// Send an SMS
/// Send one or more SMS
///
/// @param key API Key as generated from the &lt;a href&#x3D;&#39;https://www.smsfusion.com.au/admin/api/&#39;&gt;admin panel&lt;/a&gt;
/// @param num Comma separated list of phone numbers or &lt;a href&#x3D;&#39;https://www.smsfusion.com.au/help/msisdn/&#39;&gt;MSDISDN&lt;/a&gt;&#39;s
/// @param msg Message content to send
/// @param from MSISDN or vanity alphanumeric source number (optional)
/// @param deliverby UTC encoded time to send the SMS (optional)
/// @param dlrcb HTTP or HTTPS callback URL for delivery reports. Timeout for callbacks is set to 30 seconds (optional)
/// @param replycb HTTP or HTTPS callback URL for replies. Timeout for callbacks is set to 30 seconds (optional)
/// @param replyemail Email address to send replies to (optional)
/// @param validity Time in minutes to keep the SMS valid for (optional)
/// @param cc 2 character country code &lt;a href&#x3D;&#39;https://en.wikipedia.org/wiki/ISO_3166-2&#39;&gt;ISO 3166-2&lt;/a&gt; for formatting local numbers internationally (optional)
/// 
///  code:200 message:"The message(s) have been queued where possible",
///  code:401 message:"Authentication failed or paramaters not provided",
///  code:429 message:"Out of credit"
///
/// @return SWGSMSResult*
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
    completionHandler: (void (^)(SWGSMSResult* output, NSError* error)) handler;



@end
