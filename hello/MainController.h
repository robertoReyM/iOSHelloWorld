//
//  ViewController.h
//  hello
//
//  Created by Roberto Rey Magaña on 21/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"

@interface MainController : UIViewController

//buttons
@property (strong, nonatomic) IBOutlet UIButton *btnChange;


//labels
@property (strong, nonatomic) IBOutlet UILabel *lblHello;
@property (strong, nonatomic) IBOutlet UILabel *lblHello2;

- (IBAction)btnChangePressed:(id)sender;

@end

