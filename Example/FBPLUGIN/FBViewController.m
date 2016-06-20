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

#import "TFHpple.h"

#import "JCNotificationCenter.h"

#import "JCNotificationBannerPresenterSmokeStyle.h"

#import "JCNotificationBannerPresenterIOSStyle.h"

#import "JCNotificationBannerPresenterIOS7Style.h"

//#define bannerAPI @"ca-app-pub-9549102114287819/3623332283"

#define bannerAPI @"ca-app-pub-9549102114287819/6687876689"

#define fullBannerAPI @"ca-app-pub-9549102114287819/8164609882"

@interface FBViewController ()<PopUpMenuDelegate>
{
    IBOutlet UIWebView * webView;
    
    PopUpMenu * popUpWithDelegate;
}

@end

@implementation FBViewController

- (void)didPressButtonAt:(DropButton*)sender
{
    [sender didDropDownWithData:@[@{@"1":@"33"},@{@"1":@"44"}] andCompletion:^(id object) {
        NSLog(@"%@",object);
    }];
    
    [popUpWithDelegate show:BTPopUPAnimateNone];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@",_kk);
    
    NSLog(@"%@",[self isSimulator] ? @"y" : @"n");
    
    popUpWithDelegate = [[PopUpMenu alloc] initWithItemImage:@[[UIImage imageNamed:@"menu"],
                                                               [UIImage imageNamed:@"menu"]]
                                                       andTitles:@[@"Facebook", @"Messenger"]
                                                  andActionArray:nil addToViewController:self];
    popUpWithDelegate.delegate = self;
    [self.view addSubview:popUpWithDelegate];
    [popUpWithDelegate setPopUpStyle:BTPopUpStyleDefault];
    [popUpWithDelegate setPopUpBorderStyle:BTPopUpBorderStyleDefaultNone];

    DropButton * drop = (DropButton*)[self withView:self.view tag:111];
    
//    drop.pList = @"format";
    
//    [System addValue:@"d" andKey:@"dd"];
//    
//    NSLog(@"%@",[System getValue:@"dd"]);
    
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
    
//    [[LTRequest sharedInstance] didRequestInfo:@{@"CMD_CODE":@"getnewsdetail",@"id":@"335820",@"host":self,@"overrideLoading":@(1)} withCache:^(NSString *cacheString) {
//        
//    } andCompletion:^(NSString *responseString, NSError *error, BOOL isValidated) {
//        
////        NSString * head = @"<style type=\"text/css\">body { background-color: transparent; text-align: justify!important;color: #111111;} img { display: block; margin: 0 auto; height: auto;max-width: 100%;}</style>";
////        
////        NSString *htmlCode = @"<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">%@</head><body>%@</body></html>";
////        
////        NSString * final = [NSString stringWithFormat:htmlCode,head,[[responseString objectFromJSONString][@"RESULT"][@"content"] stringByReplacingOccurrencesOfString:@"style=\"width" withString:@""]];
//        
////        NSLog(@"%@", final);
////
////        
////        [webView loadHTMLString:final  baseURL:nil];
//        
//    }];
    
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
//                NSLog(@"%@",error);
//                
//                break;
//            default:
//                break;
//        }
//    }];
    
    UIBarButtonItem * menuB = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(didPressMenu)];
    self.navigationItem.leftBarButtonItem = menuB;
    
    NSString * url = @"http://www.symbols-n-emoticons.com/p/facebook-emoji-art.html";
    
    NSString * url1 = @"http://emojipedia.org/google/android-6.0.1/";
    
    NSString * url2 = @"http://emojipedia.org/mozilla/";
    
    NSString * url3 = @"http://megaemoji.com/emoticons/";
    
    NSString * url4 = @"http://emojipedia.org/emojipedia/sample-images/";
    
    NSString * url5 = @"http://emojipedia.org/unicode-6.0/";

    //http://emojipedia.org/emoji-one/
    
    //http://emojipedia.org/twitter/
    
    //http://emojipedia.org/lg/
    
    //http://emojipedia.org/samsung/
    
    //http://emojipedia.org/microsoft/
    
    //http://emojipedia.org/apple/
    
    //http://emojipedia.org/unicode-6.0/
    
    NSString * url6 = @"http://www.vatgia.com/home/quicksearch.php?keyword=iphone";
    
    [[LTRequest sharedInstance] didInitWithUrl:@{@"absoluteLink":url6,@"host":self,@"overrideLoading":@(1)} withCache:^(NSString *cacheString) {
        
//        NSLog(@"%@",cacheString);
        
    } andCompletion:^(NSString *responseString, NSError *error, BOOL isValidated) {
        
       // NSLog(@"%@",responseString);
        
        TFHpple *parser = [TFHpple hppleWithHTMLData:[responseString dataUsingEncoding:NSUTF8StringEncoding]];
        
//        NSString *pathQuery = @"//img[@class='imgemoji']";
        //NSLog(@"%@",[element objectForKey:@"src"]);

//        NSString *pathQuery1 = @"//ul[@class='emoji-grid']";
        
//        NSString *pathQuery1 = @"//div[@class='emote fl']";

        NSString *pathQuery1 = @"//div[@class='block']";

        NSArray *nodes = [parser searchWithXPathQuery:pathQuery1];
        
        NSMutableArray * arr = [NSMutableArray new];
        
        for (TFHppleElement *element in nodes)
        {
            //NSLog(@"%@",element);

            for(TFHppleElement *first in element.children)
            {
                if(first.content)
                    [arr addObject:first.content];
                
                for(TFHppleElement *second in first.children)
                {
                    for(TFHppleElement *third in second.children)
                    {
                        //if([third objectForKey:@"src"])
                            //NSLog(@"%@",[third objectForKey:@"src"]);
                    }
                }
            }
        }
        
//        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentFolder = [path objectAtIndex:0];
//        NSString *filePath = [documentFolder stringByAppendingFormat:@"myfile.plist"];
//        
//        [arr writeToFile:filePath atomically:YES];
//        
//        NSLog(@"file Stored at %@",filePath);
    }];
    
    [[DropAlert shareInstance] alertWithInfor:@{/*@"option":@(0),@"text":@"wwww",*/@"cancel":@"Close",@"buttons":@[@"Download now"],@"title":@"Attention",@"message":@"sdfsddsf"} andCompletion:^(int indexButton, id object) {
        switch (indexButton)
        {
            case 0:
            {
//                if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:dict[@"url"]]])
//                {
//                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:dict[@"url"]]];
//                }
            }
                break;
            case 1:
                
                break;
            default:
                break;
        }
    }];
    
    if(![IAPShare sharedHelper].iap)
    {
        NSSet* dataSet = [[NSSet alloc] initWithObjects:@"am.casino.barahatayo", nil];
        
        [IAPShare sharedHelper].iap = [[IAPHelper alloc] initWithProductIdentifiers:dataSet];
        
    }
    
    [IAPShare sharedHelper].iap.production = NO;
    
    [[IAPShare sharedHelper].iap requestProductsWithCompletion:^(SKProductsRequest* request,SKProductsResponse* response)
     {
         
         
         NSLog(@"__%@",response.products);
         
         
     }];
    
    [JCNotificationCenter sharedCenter].presenter = [JCNotificationBannerPresenterIOS7Style new];
    
    [JCNotificationCenter enqueueNotificationWithTitle:@"Thể Thao Số" message:@"kkkkkk" tapHandler:^{
        
    }];
}

//NSString *pathQuery1 = @"//ul[@class='emoji-grid']";
//
//NSArray *nodes = [parser searchWithXPathQuery:pathQuery1];
//
//for (TFHppleElement *element in nodes)
//{
//    for(TFHppleElement *first in element.children)
//    {
//        for(TFHppleElement *second in first.children)
//        {
//            for(TFHppleElement *third in second.children)
//            {
//                if([third objectForKey:@"src"])
//                    NSLog(@"%@",[third objectForKey:@"src"]);
//            }
//        }
//    }
//}


- (void)didPressMenu
{
//    DropButton * sender = [DropButton shareInstance];
//    
//    sender.pList = @"format";
//    
//    [sender didDropDownWithData:@[@{@"1":@"33"},@{@"1":@"44"}] andInfo:@{@"rect":[NSValue valueWithCGRect:CGRectMake(0,-40,100,100)]} andCompletion:^(id object) {
//        
//        NSLog(@"%@",object);
//
//    }];
    
//    [[DropAlert shareInstance] actionSheetWithInfo:@{@"title":@"Thong Bao",@"cancel":@"Close",@"buttons":@[@"a",@"b",@"c",@"d"],@"host":self} andCompletion:^(int indexButton, id object) {
//        
//        NSLog(@"%i",indexButton);
//
//    }];
    
    [[[PopUpMenu shareInstance] didPopUpWithInfo:@{@"images":@[@"info",@"menu"],@"titles":@[@"a",@"b"],@"color":@"#FFFFFF",@"host":self} andCompletion:^(int indexButton, id object) {
        switch (indexButton)
        {
            case 0:
            {
                NSLog(@"%@",@"0sdfdsfdsfdsfdsf");
            }
                break;
            case 1:
                NSLog(@"%@",@"1");
                break;
            default:
                
                NSLog(@"default");

                break;
        }
    }] show:BTPopUPAnimateWithFade];
}

- (void)didPressSecond
{
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
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
    
//    [[FB shareInstance] didShareFacebook:@{@"host":self,@"content":@"https://www.google.com"} andCompletion:^(NSString *responseString, id object, int errorCode, NSString *description, NSError *error) {
//        
//        NSLog(@"%@",object);
//        
//    }];
    
//    Whathehell * wat = [Whathehell new];
//
//    [self.navigationController pushViewController:wat animated:YES];
    
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
