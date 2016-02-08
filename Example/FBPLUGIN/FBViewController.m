//
//  FBViewController.m
//  FBPLUGIN
//
//  Created by thanhhaitran on 12/15/2015.
//  Copyright (c) 2015 thanhhaitran. All rights reserved.
//

#import "FBViewController.h"

#import "JSONKit.h"

#import "SecondViewController.h"

#import "DropButton.h"

#define bannerAPI @"ca-app-pub-9549102114287819/3623332283"

#define fullBannerAPI @"ca-app-pub-9549102114287819/8164609882"

@interface FBViewController ()
{
    IBOutlet UIWebView * webView;
}

@end

@implementation FBViewController

- (void)didPressButtonAt:(DropButton*)sender
{
    [sender didDropDownWithData:@[@{@"1":@"33"},@{@"1":@"44"}] andCompletion:^(id object) {
        NSLog(@"%@",object);
        
//        1027585495403-nbfgkhsdh9mjh1jfdsviiiu90shp7t7d.apps.googleusercontent.com
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DropButton * drop = (DropButton*)[self withView:self.view tag:111];
    
    drop.pList = @"format";
    
    [System addValue:@"d" andKey:@"dd"];
    
    NSLog(@"%@",[System getValue:@"dd"]);
    
//    drop.
    
    [drop addTarget:self action:@selector(didPressButtonAt:) forControlEvents:UIControlEventTouchUpInside];
    
//    [drop didDropDownWithCompletion:^(id object) {
//        
//    }];
    

//    [drop addTarget:drop action:@selector(didDropDownWithCompletion:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    [[LTRequest sharedInstance] didRequestInfo:@{@"overrideError":@(1),@"host":self,@"absoluteLink":[NSString stringWithFormat:@"http://pns.ising.vn/api/register?id=%@&appid=1", [LTRequest sharedInstance].deviceToken]} withCache:^(NSString *cacheString) {
//        
//    } andCompletion:^(NSString *responseString, NSError *error, BOOL isValidated) {
//        
//        NSLog(@"%@",responseString);
//        
//    }];
    
//    [[LTRequest sharedInstance] didRequestInfo:@{@"CMD_CODE":@"getappinfo",@"platform":@"ios",@"host":self,@"overrideLoading":@(1)} withCache:^(NSString *cacheString) {
//        
//    } andCompletion:^(NSString *responseString, NSError *error, BOOL isValidated) {
//        
//        NSLog(@"%@",responseString);
//        
//    }];
    
    [[LTRequest sharedInstance] didRequestInfo:@{@"CMD_CODE":@"getnewsdetail",@"id":@"335820",@"host":self,@"overrideLoading":@(1)} withCache:^(NSString *cacheString) {
        
    } andCompletion:^(NSString *responseString, NSError *error, BOOL isValidated) {
        
//        NSString * head = @"<style type=\"text/css\">body { background-color: transparent; text-align: justify!important;color: #111111;} img { display: block; margin: 0 auto; height: auto;max-width: 100%;}</style>";
//        
//        NSString *htmlCode = @"<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">%@</head><body>%@</body></html>";
//        
//        NSString * final = [NSString stringWithFormat:htmlCode,head,[[responseString objectFromJSONString][@"RESULT"][@"content"] stringByReplacingOccurrencesOfString:@"style=\"width" withString:@""]];
        
//        NSLog(@"%@", final);
//
//        
//        [webView loadHTMLString:final  baseURL:nil];
        
    }];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Second" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 60, 50);
    [button addTarget:self action:@selector(didPressSecond) forControlEvents:UIControlEventTouchUpInside];
    [webView addSubview:button];
    
//    [System addValue:@"keenh12" andKey:@"name1"];
//    
//    [System addValue:@"keenh11" andKey:@"name2"];
//
//    [System addValue:@"keenh10" andKey:@"name3"];
//    
//    [System addValue:@"49449" andKey:@"name33"];
//    
//    for(System * s in [System getFormat:@"key contains[cd] %@" argument:@[@"3"]])
//    {
//        NSLog(@"%@",[System getValue:s.key]);
//    }
//    
//    NSLog(@"%@",[System getValue:((System*)[System getFormat:@"key contains[cd] %@" argument:@[@"3"]][0]).key]);
    
//    [[Ads sharedInstance] didShowBannerAdsWithInfor:@{@"host":self,@"X":@(320),@"Y":@(300),@"adsId":bannerAPI,@"device":@""} andCompletion:^(BannerEvent event, NSError *error, id banner) {
//                
//        switch (event)
//        {
//            case AdsDone:
//                
//                break;
//            case AdsFailed:
//                
//                break;
//            default:
//                break;
//        }
//    }];
}

- (void)didPressSecond
{
    //[self.navigationController pushViewController:[SecondViewController new] animated:YES];
//    [[Ads sharedInstance] didShowFullAdsWithInfor:@{@"host":self,@"adsId":fullBannerAPI,@"device":@""} andCompletion:^(BannerEvent event, NSError *error, id banner) {
//        
//        switch (event)
//        {
//            case AdsDone:
//                
//                break;
//            case AdsFailed:
//                
//                break;
//            default:
//                break;
//        }
//    }];
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
