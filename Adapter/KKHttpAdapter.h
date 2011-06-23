//
//  KKHttpConnectorTypes.h
//  mixi_hd
//
//  Created by kenji.kinukawa on 11/06/08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKHttpConnectorTypes.h"

@interface KKHttpAdapter : NSObject {
	id delegate;
    NSString * identifier;
    NSString * requestID;
    int networkState;
	NSMutableData * buffer;
	NSURLConnection *connection;
    NSMutableURLRequest * request;
    NSHTTPURLResponse *response;
    NSString * receiverType;
}

-(bool)doRequest;
-(BOOL)httpGet:(NSURL*)url;
-(BOOL)httpPost:(NSURL*)url 
      param:(NSDictionary *)param 
	   body:(NSData*)body;
-(BOOL)httpDelete:(NSURL*)url;
-(void)httpCancel;

@property (nonatomic,assign) id delegate;
@property (nonatomic,retain) NSString * identifier;
@property (nonatomic,retain) NSString * requestID;
@property int networkState;
@property (nonatomic,retain) NSMutableData * buffer;
@property (nonatomic,retain) NSURLConnection *connection;
@property (nonatomic,retain) NSMutableURLRequest * request;
@property (nonatomic,retain) NSHTTPURLResponse *response;
@property (nonatomic,retain) NSString * receiverType;

@end

@interface NSObject (KKHttpConnectorTypesDelegate)
-(void)httpClient:(KKHttpAdapter *)adapter didReceiveResponse:(NSURLResponse *)res;
-(void)httpClient:(KKHttpAdapter *)adapter didReceiveData:(NSData *)receivedData;
-(void)httpClient:(KKHttpAdapter *)adapter didFailWithError:(NSError*)error;
-(void)httpClient:(KKHttpAdapter *)adapter didFinishLoading:(NSMutableData *)data;
-(void)httpClientDidCancel:(KKHttpAdapter *)adapter;
@end

