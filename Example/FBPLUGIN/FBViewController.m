//
//  FBViewController.m
//  FBPLUGIN
//
//  Created by thanhhaitran on 12/15/2015.
//  Copyright (c) 2015 thanhhaitran. All rights reserved.
//

#import "FBViewController.h"

#import "FB.h"

@interface FBViewController ()

@end

@implementation FBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)didPressButton:(id)sender
{
    FB * fb = [FB shareInstance];
    [fb startLoginFacebookWithCompletion:^(NSString *responseString, id object, int errorCode, NSString *description, NSError *error) {
        
        NSLog(@"%@",object);
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
