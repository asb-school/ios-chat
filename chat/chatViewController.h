//
//  chatViewController.h
//  chat
//
//  Created by Andrew Breja on 04/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketIO.h"

@interface chatViewController : UIViewController <SocketIODelegate>
{
    SocketIO *socketIO;
}

@end
