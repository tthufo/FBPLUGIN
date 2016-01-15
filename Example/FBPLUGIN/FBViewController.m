//
//  FBViewController.m
//  FBPLUGIN
//
//  Created by thanhhaitran on 12/15/2015.
//  Copyright (c) 2015 thanhhaitran. All rights reserved.
//

#import "FBViewController.h"

#import "TFHpple.h"

#import "JSONKit.h"

#import "SecondViewController.h"

#import "DropButton.h"

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
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DropButton * drop = (DropButton*)[self withView:self.view tag:111];
    
    drop.pList = @"format";
    
//    drop.
    
    [drop addTarget:self action:@selector(didPressButtonAt:) forControlEvents:UIControlEventTouchUpInside];
    
//    [drop didDropDownWithCompletion:^(id object) {
//        
//    }];
    
    //[button did
    
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
    
//    NSData  * data      = [NSData dataWithContentsOfFile:@"index.html"];
    
//    NSLog(@"%@",data);
    
//    [webView loadData:data MIMEType: @"text/html" textEncodingName: @"UTF-8" baseURL:nil];

    //[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"] isDirectory:NO]]];

    
//    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:data];
//    
//    NSArray * elements  = [doc searchWithXPathQuery:@"//a[@class='sponsor']"];
//    
//    TFHppleElement * element = [elements objectAtIndex:0];
//    
//    NSLog(@"%@",[element tagName]);
    
//    [e text];                       // The text inside the HTML element (the content of the first text node)
    
//    [e tagName];                    // "a"
    
//    [e attributes];                 // NSDictionary of href, class, id, etc.
//    [e objectForKey:@"href"];       // Easy access to single attribute
//    [e firstChildWithTagName:@"b"]; // The first "b" child node
}

- (void)didPressSecond
{
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
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
