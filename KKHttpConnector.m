//
//  MGHttpConnector.m
//  libMixiGraph
//
//  Created by Kinukawa Kenji on 11/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KKHttpConnector.h"

@implementation KKHttpConnector
@synthesize httpAdapterArray;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        self.httpAdapterArray = [NSMutableArray array];
    }
    
    return self;
}

- (void) dealloc {
    self.httpAdapterArray = nil;
	[super dealloc];
}

//return singleton object
+(KKHttpConnector *)sharedConnector{
    static KKHttpConnector * sharedConnector;
    if(!sharedConnector){
        sharedConnector = [[KKHttpConnector alloc]init];
    }
    return sharedConnector;
}

-(NSString *)createUniqueID{
    CFUUIDRef uuid;
    uuid = CFUUIDCreate(NULL);
    NSString * uuidString = (NSString *)CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return [uuidString autorelease];
}

-(BOOL)isNetworkAccessing{
    return [httpAdapterArray count]>0;
}

-(void)setHttpClient:(KKHttpAdapter*)httpClient{
    httpClient.requestID = [self createUniqueID];
    httpClient.delegate = self;
    //リクエスト実行して
    [httpClient doRequest];
    //保持
    [self.httpAdapterArray addObject:httpClient];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

#pragma mark - http requests

-(void)cancelAllRequests{
    //前リクエストの停止と破棄
    
}

-(void)cancelRequestById:(NSString *)requestID{
    
}

#pragma mark - httpClientDelegate method

-(int)checkRequestCounts{
    int count = [self.httpAdapterArray count];
    if(count == 0){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;       
    }
    return count;
}

-(void)httpClient:(KKHttpAdapter *)adapter didReceiveResponse:(NSURLResponse *)res{
    //通知する
    [self.httpAdapterArray removeObject:adapter];
    [self checkRequestCounts];
    KKHttpReceiver * receiver = [[[KKHttpReceiver alloc]init]autorelease];
    [receiver notifyDidReceiveResponse:res];
    
}

-(void)httpClient:(KKHttpAdapter *)adapter didReceiveData:(NSData *)receivedData{
    //通知する
    [self.httpAdapterArray removeObject:adapter];
    [self checkRequestCounts];
    KKHttpReceiver * receiver = [[[KKHttpReceiver alloc]init]autorelease];
    [receiver notifyDidReceiveData:receivedData];
    
}

-(void)httpClient:(KKHttpAdapter *)adapter didFailWithError:(NSError*)error{
    //通知する
    [self.httpAdapterArray removeObject:adapter];
    [self checkRequestCounts];
    KKHttpReceiver * receiver = [[[KKHttpReceiver alloc]init]autorelease];
    [receiver notifyDidFailWithError:error];
    
}

-(void)httpClient:(KKHttpAdapter *)adapter didFinishLoading:(NSMutableData *)data{
    [self.httpAdapterArray removeObject:adapter];
    [self checkRequestCounts];
    
    Class receiverClass = NSClassFromString(adapter.receiverType);
    KKHttpReceiver * receiver = [[[receiverClass alloc]init]autorelease];
    [receiver notifyDidFinishLoading:adapter];
}

-(void)httpClientDidCancel:(KKHttpAdapter *)adapter{
    //通知する
    
}

@end
