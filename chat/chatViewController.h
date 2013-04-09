//
//  chatViewController.h
//  chat
//
//  Created by Andrew Breja on 04/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketController.h"
#import "ChatMessagesTableController.h"


@interface chatViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
{
    SocketController *socketController;
    __weak IBOutlet UITextField *messageField;
    IBOutlet UITableView *tableView;
}

- (IBAction)onSendButtonAction:(id)sender;
- (void)updateMessageTable:(NSString *)givenMessage;

@end
