//
//  PoolsController.m
//  hello
//
//  Created by Roberto Rey Magaña on 25/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "PoolsController.h"

@implementation PoolsController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear Pools");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    // ECSlidingViewController settings.
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}


@end
