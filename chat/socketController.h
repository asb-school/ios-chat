//
//  SocketController.h
//  chat
//
//  Created by Andrew Breja on 4/8/13.
//
//

#import <Foundation/Foundation.h>
#import "SocketIO.h"

@interface SocketController : NSObject <SocketIODelegate>
{
    // PROPERTIES
    
    SocketIO *socketIOHandler;
}


// FUNCTIONS

- (void)setupConnection;
- (void)sendMessageOnChannel:(NSString*) channel andMessage:(NSString*) message;

@end