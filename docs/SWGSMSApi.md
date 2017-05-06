# SWGSMSApi

All URIs are relative to *https://api.smsfusion.com.au/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**sendSMS**](SWGSMSApi.md#sendsms) | **GET** /sms/ | Send an SMS


# **sendSMS**
```objc
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
```

Send an SMS

Send one or more SMS

### Example 
```objc
SWGDefaultConfiguration *apiConfig = [SWGDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: api_key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSString* key = @"key_example"; // API Key as generated from the <a href='https://www.smsfusion.com.au/admin/api/'>admin panel</a>
NSArray<NSString*>* num = @[@"num_example"]; // Comma separated list of phone numbers or <a href='https://www.smsfusion.com.au/help/msisdn/'>MSDISDN</a>'s
NSString* msg = @"msg_example"; // Message content to send
NSString* from = @"from_example"; // MSISDN or vanity alphanumeric source number (optional)
NSString* deliverby = @"deliverby_example"; // UTC encoded time to send the SMS (optional)
NSString* dlrcb = @"dlrcb_example"; // HTTP or HTTPS callback URL for delivery reports. Timeout for callbacks is set to 30 seconds (optional)
NSString* replycb = @"replycb_example"; // HTTP or HTTPS callback URL for replies. Timeout for callbacks is set to 30 seconds (optional)
NSString* replyemail = @"replyemail_example"; // Email address to send replies to (optional)
NSNumber* validity = @56; // Time in minutes to keep the SMS valid for (optional)
NSString* cc = @"cc_example"; // 2 character country code <a href='https://en.wikipedia.org/wiki/ISO_3166-2'>ISO 3166-2</a> for formatting local numbers internationally (optional)

SWGSMSApi*apiInstance = [[SWGSMSApi alloc] init];

// Send an SMS
[apiInstance sendSMSWithKey:key
              num:num
              msg:msg
              from:from
              deliverby:deliverby
              dlrcb:dlrcb
              replycb:replycb
              replyemail:replyemail
              validity:validity
              cc:cc
          completionHandler: ^(SWGSMSResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGSMSApi->sendSMS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **NSString***| API Key as generated from the &lt;a href&#x3D;&#39;https://www.smsfusion.com.au/admin/api/&#39;&gt;admin panel&lt;/a&gt; | 
 **num** | [**NSArray&lt;NSString*&gt;***](NSString*.md)| Comma separated list of phone numbers or &lt;a href&#x3D;&#39;https://www.smsfusion.com.au/help/msisdn/&#39;&gt;MSDISDN&lt;/a&gt;&#39;s | 
 **msg** | **NSString***| Message content to send | 
 **from** | **NSString***| MSISDN or vanity alphanumeric source number | [optional] 
 **deliverby** | **NSString***| UTC encoded time to send the SMS | [optional] 
 **dlrcb** | **NSString***| HTTP or HTTPS callback URL for delivery reports. Timeout for callbacks is set to 30 seconds | [optional] 
 **replycb** | **NSString***| HTTP or HTTPS callback URL for replies. Timeout for callbacks is set to 30 seconds | [optional] 
 **replyemail** | **NSString***| Email address to send replies to | [optional] 
 **validity** | **NSNumber***| Time in minutes to keep the SMS valid for | [optional] 
 **cc** | **NSString***| 2 character country code &lt;a href&#x3D;&#39;https://en.wikipedia.org/wiki/ISO_3166-2&#39;&gt;ISO 3166-2&lt;/a&gt; for formatting local numbers internationally | [optional] 

### Return type

[**SWGSMSResult***](SWGSMSResult.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

