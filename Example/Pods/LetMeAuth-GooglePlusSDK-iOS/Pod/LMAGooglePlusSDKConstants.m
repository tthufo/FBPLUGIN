//
//  LMAGooglePlusSDKConstants.m
//  LetMeAuth-GooglePlusSDK-iOS
//
//  Created by Alexey Aleshkov on 18/12/14.
//  Copyright (c) 2014 Webparadox, LLC. All rights reserved.
//


//#import "LMAGooglePlusSDKConstants.h"
#import <LetMeAuth/LetMeAuth.h>


NSString *LMAGooglePlusSDKClientId = @"client_id";
NSString *LMAGooglePlusSDKScope = @"scope";


__attribute__((constructor))
static void initializeConstants()
{
    LMAGooglePlusSDKClientId = LMAOAuth2ClientId;
    LMAGooglePlusSDKScope = LMAOAuth2Scope;
}
