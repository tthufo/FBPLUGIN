//
//  LMAGooglePlusSDKProvider.m
//  LetMeAuth-GooglePlusSDK-iOS
//
//  Created by Evgeniy Yurtaev on 21.11.14.
//  Copyright (c) 2014 Webparadox, LLC. All rights reserved.
//


#import "LMAGooglePlusSDKProvider.h"
#import <googleplus-ios-sdk/GooglePlus.h>
#import <googleplus-ios-sdk/GTMOAuth2Authentication.h>


@interface LMAGooglePlusSDKProvider () <GPPSignInDelegate>

@property (strong, nonatomic) GPPSignIn *signIn;
@property (copy, nonatomic) NSString *clientId;
@property (copy, nonatomic) NSArray *scopes;
@property (assign, nonatomic) BOOL cancelled;

- (void)didAuthenticateWithData:(NSDictionary *)data;
- (void)didFailWithError:(NSError *)error;
- (void)didCancel;
- (void)finish;

@end


@implementation LMAGooglePlusSDKProvider

@synthesize providerDelegate = _providerDelegate;

- (id)initWithConfiguration:(NSDictionary *)configuration
{
    NSString *clientId = [configuration objectForKey:LMAGooglePlusSDKClientId];
    NSArray *scopes = [configuration objectForKey:LMAGooglePlusSDKScope];

    NSParameterAssert(clientId != nil && [clientId length] > 0);
    
    self = [super init];
    if (!self) {
        return nil;
    }

    self.clientId = clientId;
    self.scopes = scopes;

    self.signIn = [[GPPSignIn alloc] init];
    self.signIn.clientID = clientId;

    if (scopes) {
        self.signIn.scopes = scopes;
    }
    self.signIn.delegate = self;

    [self.signIn signOut];

    return self;
}

- (void)start
{
    [self.signIn authenticate];
}

- (void)cancel
{
    self.cancelled = YES;
}

- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    // Filter login cancelling
    // TODO: Check login via Safari and tap "Cancel". It should return error!
    // See documentation for ClientId
    // scheme == bundleIdentifier
    NSString *bundleIdentifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    if (![[url scheme] isEqualToString:[bundleIdentifier lowercaseString]]) {
        return NO;
    }

    NSDictionary *queryParameters = [self parametersDictionaryFromQueryString:[url query]];
    NSString *error = queryParameters[@"error"];
    if ([error isEqualToString:@"access_denied"]) {
        [self didCancel];
        return YES;
    }

    return [self.signIn handleURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)handleDidBecomeActive
{
    [self didCancel];
    return YES;
}

#pragma mark Private methods

- (void)didAuthenticateWithData:(NSDictionary *)data
{
    [self.providerDelegate provider:self didAuthenticateWithData:data];
    [self finish];
}

- (void)didFailWithError:(NSError *)error
{
    [self.providerDelegate provider:self didFailWithError:error];
    [self finish];
}

- (void)didCancel
{
    [self.providerDelegate providerDidCancel:self];
    [self finish];
}

- (void)finish
{
    [self.signIn signOut];
    self.signIn = nil;
}

- (NSDictionary *)parametersDictionaryFromQueryString:(NSString *)queryString
{
    NSMutableDictionary *md = [[NSMutableDictionary alloc] init];

    NSArray *queryComponents = [queryString componentsSeparatedByString:@"&"];
    for (NSString *s in queryComponents) {
        NSArray *pair = [s componentsSeparatedByString:@"="];

        if ([pair count] != 2) {
            continue;
        }

        NSString *key = pair[0];
        NSString *value = pair[1];

        md[key] = value;
    }
    
    return md;
}

#pragma mark -
#pragma mark GPPSignInDelegate

- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error
{
    if (self.cancelled) {
        [self didCancel];
        return;
    }

    if (error) {
        // Filter login cancelling
        // TODO: Check login via Safari and tap "Cancel". It should return error!
        if ([error.domain isEqualToString:@"com.google.GooglePlusPlatform"] && error.code == -1 && [[error localizedDescription] isEqualToString:@"Unknown error"]) {
            [self didCancel];
            return;
        }

        [self didFailWithError:error];
    } else {
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:4];

        [data setValue:auth.accessToken forKey:LMAOAuth2AccessToken];
        [data setValue:auth.refreshToken forKey:LMAOAuth2RefreshToken];
        [data setValue:auth.expiresIn forKey:LMAOAuth2ExpiresIn];
        [data setValue:auth.expirationDate forKey:LMAExpiresAt];

        [self didAuthenticateWithData:data];
    }
}

@end
