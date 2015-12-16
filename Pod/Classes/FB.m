//
//  FB.m
//  Pods
//
//  Created by thanhhaitran on 12/15/15.
//
//

#import "FB.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

static FB * instance = nil;

@implementation FB
{
    FBCompletion completionBlock;
}

+ (FB*)shareInstance
{
    if(!instance)
    {
        instance = [FB new];
    }
    return instance;
}

- (void)startLoginFacebookWithCompletion:(FBCompletion)completion
{
    [FBSDKSettings setAppID:self.facebookAppID];
    completionBlock = completion;
    if ([FBSDKAccessToken currentAccessToken]) {
        [self requestFacebookInformation];
    }
    else
    {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithReadPermissions:@[] fromViewController:nil handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
            if (error)
            {
                completionBlock(nil, nil, -1, error.localizedDescription, error);
            }
            else if (result.isCancelled)
            {
                completionBlock(nil, nil, -1, error.localizedDescription, nil);
            }
            else
            {
                [self requestFacebookInformation];
            }
        }];
    }
}

- (void)requestFacebookInformation
{
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (error)
         {
             completionBlock(nil, nil, -1, error.localizedDescription, error);
             return;
         }
         completionBlock(@"", result, 0, @"errormessage", error);
     }];
}

- (void)signoutFacebook
{
    if ([FBSDKAccessToken currentAccessToken])
    {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logOut];
    }
    instance = nil;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBSDKAppEvents activateApp];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if (!dictionary[@"FacebookAppID"])
    {
        NSLog(@"Please setup FacebookAppID in Plist");
    }
    if (!dictionary[@"FacebookDisplayName"])
    {
        NSLog(@"Please setup FacebookDisplayName in Plist");
    }
    if (dictionary[@"FacebookAppID"])
    {
        BOOL found = NO;
        NSString *appID = [NSString stringWithFormat:@"fb%@", dictionary[@"FacebookAppID"]];
        if (dictionary[@"CFBundleURLTypes"])
        {
            for (NSDictionary *item in dictionary[@"CFBundleURLTypes"])
            {
                if (item[@"CFBundleURLSchemes"])
                {
                    for (NSString *scheme in item[@"CFBundleURLSchemes"])
                    {
                        if ([scheme isEqualToString:appID])
                        {
                            found = YES;
                            break;
                        }
                    }
                }
            }
        }
        if (!found)
        {
            NSLog(@"Please setup URL types in Plist as %@", appID);
        }
        
    }
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}


@end
