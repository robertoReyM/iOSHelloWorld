//
//  Page1Controller.h
//  hello
//
//  Created by Roberto Rey Magaña on 21/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellTeamIds.h"
#import "Declarations.h"
#import "League.h"
#import "Matchday.h"
#import "Match.h"

@interface Page1Controller : UIViewController<UITableViewDelegate,UITableViewDataSource>

//buttons
@property (strong, nonatomic) IBOutlet UIButton *btnBack;

//actions
- (IBAction)btnBackPressed:(id)sender;

@end
