//
//  SocketController.m
//  chat
//
//  Created by Andrew Breja on 4/8/13.
//
//

#import "SocketController.h"

@implementation SocketController


// --------------------------------------------------------------
// SETUP CONNECTION

- (void)setupConnection
{
    // Setup Socket IO
    socketIOHandler = [[SocketIO alloc] initWithDelegate:self];
    
    // Create connection to server
    [socketIOHandler connectToHost:@"localhost" onPort:5050];
}


// --------------------------------------------------------------
// SEND MESSAGE

- (void)sendMessageOnChannel:(NSString *)channel andMessage:(NSString *)message
{
    // Setup message object with a dictionary
    NSMutableDictionary *messageObject = [NSMutableDictionary dictionary];
    
    // Add data to message object
    [messageObject setObject:message forKey:@"msg"];
    
    // Send the data to the server
    [socketIOHandler sendEvent:channel withData:messageObject];
}


// --------------------------------------------------------------
// ON RECEIVE EVENT

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet
{
    NSLog(@"didReceiveEvent()");
    
    // SocketIO Callback
    SocketIOCallback cb = ^(id argsData)
    {
        NSDictionary *response = argsData;
        
        // do something with response
        NSLog(@"ack arrived: %@", response);
    };
    
    [socketIOHandler sendMessage:@"hello back!" withAcknowledge:cb];
}


// --------------------------------------------------------------
// ON FAILURE TO CONNECT

- (void) socketIO:(SocketIO *)socket failedToConnectWithError:(NSError *)error
{
    NSLog(@"failedToConnectWithError() %@", error);
}



@end
