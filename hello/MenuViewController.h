//
//  MenuViewController.h
//  hello
//
//  Created by Roberto Rey Magaña on 25/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "cellMenu.h"
#import "Declarations.h"


@interface MenuViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UIImageView *ivProfile;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblLogout;
@property (strong, nonatomic) IBOutlet UITableView *tblMenu;

@end
