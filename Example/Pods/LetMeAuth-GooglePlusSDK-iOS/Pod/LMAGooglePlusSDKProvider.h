//
//  LMAGooglePlusSDKProvider.h
//  LetMeAuth-GooglePlusSDK-iOS
//
//  Created by Evgeniy Yurtaev on 21.11.14.
//  Copyright (c) 2014 Webparadox, LLC. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <LetMeAuth/LetMeAuth.h>
#import "LMAGooglePlusSDKConstants.h"


/*
 Return

 LMAOAuth2AccessToken => NSString. Access token
 LMAOAuth2RefreshToken => NSString. Refresh token
 LMAOAuth2ExpiresIn => NSNumber. Time when token expires
 LMAExpiresAt => NSDate. Expiration date
 */
@interface LMAGooglePlusSDKProvider : NSObject <LMAProvider>

@end
