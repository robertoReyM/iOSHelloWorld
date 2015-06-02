//
//  SlidingMenuViewController.m
//  hello
//
//  Created by Roberto Rey Magaña on 25/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "SlidingMenuViewController.h"

@implementation SlidingMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    
    NSLog(@"SlidingMenuViewController");
    
    switch (mMenuState)
    {
        case nPools:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"PoolsController"];
            NSLog(@"Pools");
            break;
        case nHistory:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"History"];
            NSLog(@"Ticket");
            break;
        case nTicket:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Ticket"];
            NSLog(@"Ticket");
            break;
        case nRules:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Rules"];
            NSLog(@"Rules");
            break;
        case nSettings:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Settings"];
            NSLog(@"Settings");
            break;
        case nNotifications:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Notifications"];
            NSLog(@"Notifications");
            break;
        case nSupport:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Feedback"];
            NSLog(@"Feedback");
            break;
        case nAbout:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"About"];
            NSLog(@"About");
            break;
        case nProfile:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Profile"];
            NSLog(@"Profile");
            break;
        case nPositions:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Positions"];
            NSLog(@"nPositions");
            break;
        case nOtherUserTicket:
            self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"OtherTicketPools"];
            NSLog(@"nOtherUserTicket");
            break;
        default:
            break;
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
