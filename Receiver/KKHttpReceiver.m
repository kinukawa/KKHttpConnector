//
//  HttpReceiver.m
//  libMixiGraph
//
//  Created by Kinukawa Kenji on 11/06/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KKHttpReceiver.h"

@implementation KKHttpReceiver

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)notifyDidReceiveResponse:(NSURLResponse *)response{
    NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                               response, @"response",
                               nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notifyDidReceiveResponse" object:self userInfo:userInfo];

}

-(void)notifyDidReceiveData:(NSData *)receivedData{
    NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                               receivedData, @"receivedData",
                               nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notifyDidReceiveData" object:self userInfo:userInfo];

}

-(void)notifyDidFailWithError:(NSError*)error{
    NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                               error, @"error",
                               nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notifyDidFailWithError" object:self userInfo:userInfo];
}

-(void)notifyDidFinishLoading:(KKHttpAdapter *)adapter{
    //NSString *contents = [[[NSString alloc] initWithData:client.buffer encoding:NSUTF8StringEncoding] autorelease];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notifyDidFinishLoading" object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                               adapter.buffer, @"data",
                                                                                                               adapter.identifier,@"identifier",
                                                                                                               nil]];
}
@end
