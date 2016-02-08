//
//  Ads.m
//  Pods
//
//  Created by thanhhaitran on 2/8/16.
//
//

#import "Ads.h"

#import "NSObject+Category.h"

@import GoogleMobileAds;

static Ads * __shareVar;

@interface Ads () <GADInterstitialDelegate, GADBannerViewDelegate>
{
    GADBannerView *mBannerView;
    
    GADInterstitial *interstitial;
    
    AdsCompletion comp;
    
    NSDictionary * fullAdsInfo;
}
@end

@implementation Ads

+ (Ads *)sharedInstance
{
    if (!__shareVar)
    {
        __shareVar = [[Ads alloc] init];
    }
    return __shareVar;
}

- (void)didShowBannerAdsWithInfor:(NSDictionary*)infor andCompletion:(AdsCompletion)completion
{
    comp = completion;
    
    mBannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
    
    if([infor responseForKey:@"device"])
    {
        mBannerView.backgroundColor = [UIColor redColor];
    }
    mBannerView.delegate = self;
    
    mBannerView.frame = CGRectMake(([infor[@"X"] floatValue] - mBannerView.frame.size.width) / 2, [infor[@"Y"] floatValue], mBannerView.frame.size.width, mBannerView.frame.size.height);
    
    mBannerView.adUnitID = infor[@"adsId"];
    
    mBannerView.rootViewController = infor[@"host"];
    
    [((UIViewController*)infor[@"host"]).view addSubview:mBannerView];
    
    GADRequest *request = [GADRequest request];
    
    if([infor responseForKey:@"device"])
    {
        NSMutableArray * arr = [[NSMutableArray alloc] initWithObjects:kGADSimulatorID, nil];
        
        if(((NSString*)infor[@"device"]).length != 0)
        {
            [arr addObject:infor[@"device"]];
        }
        
        request.testDevices = arr;
    }
    
    [mBannerView loadRequest:request];
}

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView
{
    comp(AdsDone, nil, bannerView);
}

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error
{
    comp(AdsFailed, error, bannerView);
}

#pragma mark Click-Time Lifecycle Notifications


- (void)adViewWillPresentScreen:(GADBannerView *)bannerView
{
    comp(AdsWillPresent, nil, bannerView);
}

- (void)adViewWillDismissScreen:(GADBannerView *)bannerView
{
    comp(AdsWillDismiss, nil, bannerView);
}

- (void)adViewDidDismissScreen:(GADBannerView *)bannerView
{
    comp(AdsDidDismiss, nil, bannerView);
}

- (void)adViewWillLeaveApplication:(GADBannerView *)bannerView
{
    comp(AdsWillLeave, nil, bannerView);
}

#pragma FullAds

- (void)didShowFullAdsWithInfor:(NSDictionary*)infor andCompletion:(AdsCompletion)completion
{
    comp = completion;
    
    fullAdsInfo = infor;
    
    [self didCreateFullAds:infor];
}

- (void)didCreateFullAds:(NSDictionary*)infor
{
    interstitial = [[GADInterstitial alloc] initWithAdUnitID:infor[@"adsId"]];
    
    interstitial.delegate = self;
    
    GADRequest *request = [GADRequest request];
    
    if([infor responseForKey:@"device"])
    {
        NSMutableArray * arr = [[NSMutableArray alloc] initWithObjects:kGADSimulatorID, nil];
        
        if(((NSString*)infor[@"device"]).length != 0)
        {
            [arr addObject:infor[@"device"]];
        }
        
        request.testDevices = arr;
    }
    
    [interstitial loadRequest:request];
}

- (void)interstitialDidReceiveAd:(GADInterstitial *)ad
{
    comp(AdsDone, nil, ad);
    
    if(interstitial.isReady)
        [interstitial presentFromRootViewController:fullAdsInfo[@"host"]];
}

- (void)interstitial:(GADInterstitial *)interstitial didFailToReceiveAdWithError:(GADRequestError *)error
{
    comp(AdsFailed, error, nil);
}

- (void)interstitialWillPresentScreen:(GADInterstitial *)ad
{
    comp(AdsWillPresent, nil, ad);
}

- (void)interstitialWillDismissScreen:(GADInterstitial *)ad
{
    comp(AdsWillDismiss, nil, ad);
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)ad
{
    comp(AdsDidDismiss, nil, ad);
}

- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad
{
    comp(AdsWillLeave, nil, ad);
}

@end
