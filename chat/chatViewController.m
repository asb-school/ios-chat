//
//  chatViewController.m
//  chat
//
//  Created by Andrew Breja on 04/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "chatViewController.h"

@implementation chatViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Setup Socket IO
    socketIO = [[SocketIO alloc] initWithDelegate:self];
    
    //socketIO.useSecure = YES;
    
    // Create connection to server
    [socketIO connectToHost:@"localhost" onPort:5050];
    
    // Setup dictionary for message data
    NSMutableDictionary *messageObject = [NSMutableDictionary dictionary];
    [messageObject setObject:@"i am the client!" forKey:@"msg"];

    // Send data to server
    [socketIO sendEvent:@"main" withData:messageObject];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}



// Socket IO Event Functions

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
    
    [socketIO sendMessage:@"hello back!" withAcknowledge:cb];
}

- (void) socketIO:(SocketIO *)socket failedToConnectWithError:(NSError *)error
{
    NSLog(@"failedToConnectWithError() %@", error);
}


@end
