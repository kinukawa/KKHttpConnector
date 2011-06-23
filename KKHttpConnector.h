//
//  MGHttpConnector.h
//  libMixiGraph
//
//  Created by Kinukawa Kenji on 11/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKHttpAdapter.h"
#import "KKHttpReceiver.h"

@interface KKHttpConnector : NSObject{
    NSMutableArray * httpAdapterArray;
}

@property (nonatomic, readonly, getter = isNetworkAccessing) BOOL networkAccessing;
@property (nonatomic, retain) NSMutableArray * httpAdapterArray;
+(KKHttpConnector *)sharedConnector;
-(void)setHttpClient:(KKHttpAdapter*)httpClient;
-(void)cancelAllRequests;
-(NSString *)createUniqueID;

@end
