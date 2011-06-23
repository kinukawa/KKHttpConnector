//
//  KKHttpConnectorTypes.h
//  libMixiGraph
//
//  Created by Kinukawa Kenji on 11/06/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    MIXINetworkStateNotConnected = 0,
    MIXINetworkStateInProgress,
    MIXINetworkStateFinished,
    MIXINetworkStateError,
    MIXINetworkStateCanceled,
} MIXINetworkState;

#define KK_HTTP_RECEIVER_NORMAL     @"KKHttpReceiver"

@interface KKHttpConnectorTypes : NSObject

@end
