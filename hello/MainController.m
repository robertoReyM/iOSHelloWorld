//
//  ViewController.m
//  hello
//
//  Created by Roberto Rey Magaña on 21/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "MainController.h"


int iIndex = 0;

@interface MainController ()

@end

@implementation MainController


/**********************************************************************************************/
#pragma mark - Initialization
/**********************************************************************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self initViewController];
    [self initMatchdaysData ];
}

//----------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//----------------------------------------------------------------------------------------------
-(void)initViewController{
    
    
    //init mutable array
    maTeams             = [[NSMutableArray alloc] init];
    NSArray *aTeamNames = [[NSArray alloc] init];
    
    //get team names
    aTeamNames = [nArrayTeamNames componentsSeparatedByString:@","];
    
    //init teams array
    for (int i = 0; i<aTeamNames.count; i++) {
        
        Team *team = [[Team alloc] init];
        team.teamID = i;
        team.teamName = [NSString stringWithFormat:@"%@",aTeamNames[i]];
        [maTeams addObject:team];
        
        NSLog(@"maSmartplace = %@", team.teamName);
    }
    

}

/**********************************************************************************************/
#pragma mark - All matchdays
/**********************************************************************************************/

-(void)initMatchdaysData
{
    //check for all matchdays locally
    if (![[MemoryServices getAllMatchdays] isEqual:nil])
    {
        //parse data into global variable
        [ParserHelper parseGetAllMatchdays];
        
        //notify on view
        self.lblHello2.text= ((Matchday *)mLeague.matchdays[0]).mdName;
    }
    
    //request info from server
    [self getAllMatchdaysDataFromServer];
    
}

//----------------------------------------------------------------------------------------------

- (void) getAllMatchdaysDataFromServer{
    
    //get on queue the procedure of getting all matchdays and on all matchdays received
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSOperationQueue *queue = [NSOperationQueue new];
    
    //add operation to get all matchdays
    NSInvocationOperation *opGetAllMatchdays      = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(opAllMatchdaysDataRequest) object:nil];
    [queue addOperation:opGetAllMatchdays];
    
    //add operation to get notified when all matchdays are received
    NSInvocationOperation *opDoneGetAllMatchdays  = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(opAllMatchdaysReceived) object:nil];
    [opDoneGetAllMatchdays addDependency:opGetAllMatchdays];
    [queue addOperation:opDoneGetAllMatchdays];
    
}

//----------------------------------------------------------------------------------------------
- (void) opAllMatchdaysDataRequest{
    
    
    //get all matchdays from server
    [WebServices getAllMatchdays];
    
}

//----------------------------------------------------------------------------------------------
- (void) opAllMatchdaysReceived{
 
    
    self.lblHello.text= ((Matchday *)mLeague.matchdays[0]).mdName;
    NSLog(@"Matchdays received and set");
    
}


/**********************************************************************************************/
#pragma mark - Button actions
/**********************************************************************************************/
- (IBAction)btnChangePressed:(id)sender {
    
    [self getAllMatchdaysDataFromServer];
    
}

//----------------------------------------------------------------------------------------------
- (IBAction)btnNextPressed:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SlidingMenuViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SlidingMenuViewController"];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate transitionToViewController:vc
                             withTransition:UIViewAnimationOptionTransitionFlipFromRight];

    /*
    Page1Controller *page1 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"Page1Controller"];
    [self presentViewController:page1 animated:YES completion:nil];
    */
}
@end
