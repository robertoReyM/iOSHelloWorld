//
//  MenuViewController.m
//  hello
//
//  Created by Roberto Rey Magaña on 25/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController()
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSArray *menuImgs;
@end


@implementation MenuViewController

- (void)awakeFromNib
{
    NSLog(@"awakeFromNib");
    self.menuItems =  [NSArray arrayWithObjects:
                       [NSString stringWithFormat:@"Quinielas"],
                       [NSString stringWithFormat:@"Posiciones"],
                       [NSString stringWithFormat:@"Tabla"],
                       [NSString stringWithFormat:@"Boletos comprados"],
                       [NSString stringWithFormat:@"Reglas"],
                       [NSString stringWithFormat:@"Notificaciones"],
                       [NSString stringWithFormat:@"Ajustes"],
                       nil];
    
    self.menuImgs =   [NSArray arrayWithObjects:
                       [NSString stringWithFormat:@"ic_pools.png"],
                       [NSString stringWithFormat:@"ic_positions.png"],
                       [NSString stringWithFormat:@"ic_table.png"],
                       [NSString stringWithFormat:@"ic_history.png"],
                       [NSString stringWithFormat:@"ic_rules.png"],
                       [NSString stringWithFormat:@"ic_NotificationsMenu.png"],
                       [NSString stringWithFormat:@"ic_cfg.png"],
                       nil];
}

/**********************************************************************************************/
#pragma mark - Initialization
/**********************************************************************************************/
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad Menu");
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
   
    
    self.tblMenu.allowsSelection    = YES;
    self.lblLogout.text             = @"Cerrar sesión";
    
    [self.tblMenu setContentInset:UIEdgeInsetsMake(0,0,50,0)];
    
}

/**********************************************************************************************/
#pragma mark - Table delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellMenu");
    static NSString *CellIdentifier = @"cellMenu";
    
    cellMenu *cell = (cellMenu *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        UIImageView *bgView = [[UIImageView alloc]initWithFrame:cell.frame];
        //bgView.backgroundColor = [UIColor nBlackLateralMenu];
        cell.selectedBackgroundView = bgView;
        [tableView registerNib:[UINib nibWithNibName:@"cellMenu" bundle:nil] forCellReuseIdentifier:@"cellMenu"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMenu"];
    }
    
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:cell.frame];
    //bgView.backgroundColor = [UIColor nBlackLateralMenu];
    cell.selectedBackgroundView = bgView;
    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.lblMenu.text   = [self.menuItems objectAtIndex:[indexPath row]];
    cell.ivMenu.image  = [UIImage imageNamed:[self.menuImgs objectAtIndex:[indexPath row]]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *newTopViewController;
    
    switch (indexPath.row)
    {
        case nPools:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PoolsController"];
            break;
        case nPositions:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Positions"];
            break;
        case nTable:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Table"];
            break;
        case nHistory:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"History"];
            break;
        case nRules:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Rules"];
            break;
        case nNotifications:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Notifications"];
            break;
        case nSettings:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Settings"];
            break;
        default:
            break;
    }
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}


@end
