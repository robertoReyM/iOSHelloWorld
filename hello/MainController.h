//
//  ViewController.h
//  hello
//
//  Created by Roberto Rey Magaña on 21/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"
#import "SlidingMenuViewController.h"
#import "Page1Controller.h"
#import "AppDelegate.h"
#import "Team.h"
#import "MemoryServices.h"
#import "WebServices.h"
#import "Matchday.h"
#import "Match.h"

@interface MainController : UIViewController


//buttons
@property (strong, nonatomic) IBOutlet UIButton *btnChange;
@property (strong, nonatomic) IBOutlet UIButton *btnNext;


//labels
@property (strong, nonatomic) IBOutlet UILabel *lblHello;
@property (strong, nonatomic) IBOutlet UILabel *lblHello2;

//actions
- (IBAction)btnChangePressed:(id)sender;
- (IBAction)btnNextPressed:(id)sender;

@end

