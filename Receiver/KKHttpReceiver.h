//
//  HttpReceiver.h
//  libMixiGraph
//
//  Created by Kinukawa Kenji on 11/06/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKHttpAdapter.h"

@interface KKHttpReceiver : NSObject{
    
}
-(void)notifyDidReceiveResponse:(NSURLResponse *)response;
-(void)notifyDidReceiveData:(NSData *)receivedData;
-(void)notifyDidFailWithError:(NSError*)error;
-(void)notifyDidFinishLoading:(KKHttpAdapter*)client;
@end
