//
//  chatViewController.m
//  chat
//
//  Created by Andrew Breja on 04/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "chatViewController.h"

@implementation chatViewController

// --------------------------------------------------------------
// ON SEND MESSAGE BUTTON PRESS

- (IBAction)onSendButtonAction:(id)sender
{
    // Send message given text
    [socketController sendMessageOnChannel:@"main" andMessage:messageField.text];
    
    // Clear text field
    [messageField setText:@""];
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // Send a message if it's the message field
    if (textField == messageField)
    {
        [socketController sendMessageOnChannel:@"main" andMessage:textField.text];
    }
    
    // Clear text field
    [textField setText:@""];
    
    // Clear keyboard
    //[textField resignFirstResponder];
    return NO;
}


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
    
    // Set text field delegate
    messageField.delegate = self;
 
    // Create a socket controller
    socketController = [SocketController new];
    
    // Setup connection
    [socketController setupConnection];
    
    // Send a message
    [socketController sendMessageOnChannel:@"main" andMessage:@"i am the client!"];
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

@end
