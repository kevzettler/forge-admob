#import "admob_API.h"

GADBannerView *bannerView_;
@implementation admob_API

//
// Here you can implement your API methods which can be called from JavaScript
// an example method is included below to get you started.
//


+ (void)footerBanner:(ForgeTask*)task {
    GADBannerView *bannerView_;
    UIViewController* parentVC = [[ForgeApp sharedApp] viewController];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    [parentVC.view setFrame:CGRectMake(0, 0, screenWidth, screenHeight-50)];
    
    CGPoint origin = CGPointMake(0.0, screenHeight - 50); //Update the X and Y origin to what you need, ex: (0.0, 204.0)
    
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner origin:origin];
    
    // Specify the ad unit ID.
    bannerView_.adUnitID = @"a1529bbd54e3737";
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = parentVC;
    [parentVC.view addSubview:bannerView_];
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:[GADRequest request]];
    
    [task success:nil];
}

+ (void)refresh:(ForgeTask*)task {
    [bannerView_ loadRequest:[GADRequest request]];
    [task success:nil];
}

@end
