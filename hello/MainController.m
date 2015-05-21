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
    [self InitViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)InitViewController{
    
    //Array with team ids (in the future, this might be downloaded from web service
    maSmartplace         = [[NSMutableArray alloc] initWithCapacity: 2];
    
    //Liga MX teams
    [maSmartplace insertObject:[NSMutableArray arrayWithObjects: @"1441", @"1443", @"1445", @"1446", @"1447", @"1448", @"1449", @"1450", @"1451", @"1452", @"1454", @"1456", @"1457", @"1458", @"1751", @"1753", @"6205", @"7592",  nil] atIndex:0];
    //America teams
    [maSmartplace insertObject:[NSMutableArray arrayWithObjects: @"346", @"865", @"409", @"1160", @"418", @"408", @"970", @"2094", @"419", @"1992", @"461", @"2096", @"2693", @"971", @"968", @"972", @"2694", @"417", @"416", @"967", @"969", nil] atIndex:1];
    
    NSLog(@"maSmartplace = %@", maSmartplace);
}

/**********************************************************************************************/
#pragma mark - Button actions
/**********************************************************************************************/

- (IBAction)btnChangePressed:(id)sender {
    
    @try {
        self.lblHello.text= maSmartplace[0][iIndex++];
    }
    @catch (NSException *exception) {
        
        _lblHello.text = @"Ya se acabo";
    }
    _lblHello2.text = @"Roberto Rey 2";
}
@end
