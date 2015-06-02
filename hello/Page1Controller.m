//
//  Page1Controller.m
//  hello
//
//  Created by Roberto Rey Magaña on 21/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Page1Controller.h"

@interface Page1Controller ()

@end

@implementation Page1Controller


/**********************************************************************************************/
#pragma mark - Initialization
/**********************************************************************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnBackPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**********************************************************************************************/
#pragma mark - Table delegates
/**********************************************************************************************/

//-------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mLeague.matchdays count];
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (1)
    {
        //1. Setup the CATransform3D structure
        CATransform3D rotation;
        rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
        rotation.m34 = 1.0/ -600;
        
        //2. Define the initial state (Before the animation)
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        cell.layer.anchorPoint = CGPointMake(0, 0.5);
        
        //3. Define the final state (After the animation) and commit the animation
        [UIView beginAnimations:@"rotation" context:NULL];
        [UIView setAnimationDuration:0.4];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        
        //Reassure that cell its in its place (WaGo)
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        [UIView commitAnimations];
    }
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cellTeamIds";
    
    cellTeamIds *cell = (cellTeamIds *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"cellTeamIds" bundle:nil] forCellReuseIdentifier:@"cellTeamIds"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellTeamIds"];
    }

    cell.lblID.text = [NSString stringWithFormat:@"%d",((Matchday *)mLeague.matchdays[indexPath.row]).mdID];
    cell.lblName.text = [NSString stringWithFormat:@"%@",((Matchday *)mLeague.matchdays[indexPath.row]).mdName];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
