# SWGDefaultApi

All URIs are relative to *http://api.smsfusion.com.au/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getHLR**](SWGDefaultApi.md#gethlr) | **GET** /hlr/ | HLR number lookup
[**getHLRCallback**](SWGDefaultApi.md#gethlrcallback) | **GET** /hlr-callback/ | HLR number lookup with results going to a callback URL


# **getHLR**
```objc
-(NSURLSessionTask*) getHLRWithKey: (NSString*) key
    num: (NSString*) num
    cc: (NSString*) cc
        completionHandler: (void (^)(SWGHLRCallback* output, NSError* error)) handler;
```

HLR number lookup

Perform HLR on number

### Example 
```objc
SWGDefaultConfiguration *apiConfig = [SWGDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: api_key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSString* key = @"key_example"; // API Key as generated from the <a href='https://www.smsfusion.com.au/admin/api/'>admin panel</a>
NSString* num = @"num_example"; // A single phone number or <a href='https://www.smsfusion.com.au/help/msisdn/'>MSDISDN</a>
NSString* cc = @"cc_example"; // 2 character country code <a href='https://en.wikipedia.org/wiki/ISO_3166-2'>ISO 3166-2</a> for formatting local numbers internationally (optional)

SWGDefaultApi*apiInstance = [[SWGDefaultApi alloc] init];

// HLR number lookup
[apiInstance getHLRWithKey:key
              num:num
              cc:cc
          completionHandler: ^(SWGHLRCallback* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGDefaultApi->getHLR: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **NSString***| API Key as generated from the &lt;a href&#x3D;&#39;https://www.smsfusion.com.au/admin/api/&#39;&gt;admin panel&lt;/a&gt; | 
 **num** | **NSString***| A single phone number or &lt;a href&#x3D;&#39;https://www.smsfusion.com.au/help/msisdn/&#39;&gt;MSDISDN&lt;/a&gt; | 
 **cc** | **NSString***| 2 character country code &lt;a href&#x3D;&#39;https://en.wikipedia.org/wiki/ISO_3166-2&#39;&gt;ISO 3166-2&lt;/a&gt; for formatting local numbers internationally | [optional] 

### Return type

[**SWGHLRCallback***](SWGHLRCallback.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHLRCallback**
```objc
-(NSURLSessionTask*) getHLRCallbackWithKey: (NSString*) key
    num: (NSArray<NSString*>*) num
    cb: (NSString*) cb
    cc: (NSString*) cc
        completionHandler: (void (^)(SWGHLRResult* output, NSError* error)) handler;
```

HLR number lookup with results going to a callback URL

Perform HLR on number with the result being sent to the callback URL provided

### Example 
```objc
SWGDefaultConfiguration *apiConfig = [SWGDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: api_key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSString* key = @"key_example"; // API Key as generated from the <a href='https://www.smsfusion.com.au/admin/api/'>admin panel</a>
NSArray<NSString*>* num = @[@"num_example"]; // Comma separated list of phone numbers or <a href='https://www.smsfusion.com.au/help/msisdn/'>MSDISDN</a>'s
NSString* cb = @"cb_example"; // HTTP or HTTPS callback URL for each result. The result will be sent as POST with a json object included in <b>result</b>. Timeout for callbacks is set to 30 seconds
NSString* cc = @"cc_example"; // 2 character country code <a href='https://en.wikipedia.org/wiki/ISO_3166-2'>ISO 3166-2</a> for formatting local numbers internationally (optional)

SWGDefaultApi*apiInstance = [[SWGDefaultApi alloc] init];

// HLR number lookup with results going to a callback URL
[apiInstance getHLRCallbackWithKey:key
              num:num
              cb:cb
              cc:cc
          completionHandler: ^(SWGHLRResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGDefaultApi->getHLRCallback: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **NSString***| API Key as generated from the &lt;a href&#x3D;&#39;https://www.smsfusion.com.au/admin/api/&#39;&gt;admin panel&lt;/a&gt; | 
 **num** | [**NSArray&lt;NSString*&gt;***](NSString*.md)| Comma separated list of phone numbers or &lt;a href&#x3D;&#39;https://www.smsfusion.com.au/help/msisdn/&#39;&gt;MSDISDN&lt;/a&gt;&#39;s | 
 **cb** | **NSString***| HTTP or HTTPS callback URL for each result. The result will be sent as POST with a json object included in &lt;b&gt;result&lt;/b&gt;. Timeout for callbacks is set to 30 seconds | 
 **cc** | **NSString***| 2 character country code &lt;a href&#x3D;&#39;https://en.wikipedia.org/wiki/ISO_3166-2&#39;&gt;ISO 3166-2&lt;/a&gt; for formatting local numbers internationally | [optional] 

### Return type

[**SWGHLRResult***](SWGHLRResult.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

