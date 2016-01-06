//
//  FBViewController.m
//  FBPLUGIN
//
//  Created by thanhhaitran on 12/15/2015.
//  Copyright (c) 2015 thanhhaitran. All rights reserved.
//

#import "FBViewController.h"

@interface FBViewController ()

@end

@implementation FBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [[LTRequest sharedInstance] didRequestInfo:@{@"overrideError":@(1),@"host":self,@"absoluteLink":[NSString stringWithFormat:@"http://pns.ising.vn/api/register?id=%@&appid=1", [LTRequest sharedInstance].deviceToken]} withCache:^(NSString *cacheString) {
//        
//    } andCompletion:^(NSString *responseString, NSError *error, BOOL isValidated) {
//        
//        NSLog(@"%@",responseString);
//        
//    }];
    
    [[LTRequest sharedInstance] didRequestInfo:@{@"CMD_CODE":@"getappinfo",@"platform":@"ios",@"host":self,@"overrideLoading":@(1)} withCache:^(NSString *cacheString) {
        
    } andCompletion:^(NSString *responseString, NSError *error, BOOL isValidated) {
        
        NSLog(@"%@",responseString);
        
    }];
    
    [System addValue:@"keenh12" andKey:@"name1"];
    
    [System addValue:@"keenh11" andKey:@"name2"];

    [System addValue:@"keenh10" andKey:@"name3"];
    
    [System addValue:@"49449" andKey:@"name33"];
    
    for(System * s in [System getFormat:@"key contains[cd] %@" argument:@[@"3"]])
    {
        NSLog(@"%@",[System getValue:s.key]);
    }
    
    NSLog(@"%@",[System getValue:((System*)[System getFormat:@"key contains[cd] %@" argument:@[@"3"]][0]).key]);
}

- (IBAction)didPressCamera:(id)sender
{
    [[FB shareInstance] startPickImageWithOption:YES andBase:sender andRoot:self andCompletion:^(NSString *responseString, id object, int errorCode, NSString *description, NSError *error) {
        
        NSLog(@"%@",object);
        
    }];
}

- (IBAction)didPressGallery:(id)sender
{
    [[FB shareInstance] startPickImageWithOption:NO andBase:sender andRoot:self andCompletion:^(NSString *responseString, id object, int errorCode, NSString *description, NSError *error) {
        
        NSLog(@"%@",object);
        
    }];
}

- (IBAction)didPressShare:(id)sender
{
    
    [[FB shareInstance] startShareWithInfo:@[@"share this",@""] andBase:sender andRoot:self andCompletion:^(NSString *responseString, id object, int errorCode, NSString *description, NSError *error) {
        
        NSLog(@"%i",errorCode);
        
    }];

}

- (IBAction)didPressButton:(id)sender
{
    FB * fb = [FB shareInstance];
    [fb startLoginFacebookWithCompletion:^(NSString *responseString, id object, int errorCode, NSString *description, NSError *error) {
        
        NSLog(@"%@",object);
        
    }];
}

- (IBAction)didPressLogout:(id)sender
{
    FB * fb = [FB shareInstance];
    
    [fb signoutFacebook];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
