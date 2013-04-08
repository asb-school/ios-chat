//
//  chatViewController.h
//  chat
//
//  Created by Andrew Breja on 04/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketController.h"


@interface chatViewController : UIViewController <UITextFieldDelegate>
{
    SocketController *socketController;
    __weak IBOutlet UITextField *messageField;
    __weak IBOutlet UITableView *messageView;
}

- (IBAction)onSendButtonAction:(id)sender;

@end
