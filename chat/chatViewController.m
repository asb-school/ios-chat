//
//  chatViewController.m
//  chat
//
//  Created by Andrew Breja on 04/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "chatViewController.h"

@implementation chatViewController
{
    NSMutableArray *tableData;
}


- (void)initialSetup
{
    tableData = [NSMutableArray new];
    
    [tableData addObject:@"one"];
    [tableData addObject:@"two"];
    [tableData addObject:@"three"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}


- (void)updateMessageTable:(NSString *)givenMessage
{
    // Add another item to the table
    [tableData addObject:givenMessage];
 
    // Reload table view
    [tableView reloadData];
    
    // Scroll to bottom
    [tableView scrollToRowAtIndexPath: [NSIndexPath indexPathForRow:[tableData count]-1 inSection:0] atScrollPosition: UITableViewScrollPositionTop animated: YES];
}


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
    
    [self initialSetup];
    
    // Set text field delegate
    messageField.delegate = self;
    
//    tableView.delegate = self;
//    tableView.dataSource = self;
// 
    // Create a socket controller
    socketController = [SocketController new];
    
    
    [socketController setUpdateCallbackFunction:self withSelect:@selector(updateMessageTable:)];
    
//    SEL callback = @selector(updateMessageTable:);
    
//    [socketController setUpdateCallbackFunction:callback];
    
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
