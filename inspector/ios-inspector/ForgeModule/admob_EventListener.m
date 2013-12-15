#import "admob_EventListener.h"

@implementation admob_EventListener

//
// Here you can implement event listeners.
// These are functions which will get called when certain native events happen.
//

+ (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [[ForgeApp sharedApp] event:@"admob.orientation" withParam:nil];
    
    UIViewController* parentVC = [[ForgeApp sharedApp] viewController];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    [parentVC.view setFrame:CGRectMake(0, 0, screenWidth, screenHeight-50)];
    
    
    // The updated y value for the origin.
    CGFloat yLocation;
    
    // Set a new frame to update the origin on orientation change. Remember to set
    // adSize first before you update the frame.
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        bannerView_.adSize = kGADAdSizeSmartBannerLandscape;
        yLocation = screenWidth -
        CGSizeFromGADAdSize(kGADAdSizeSmartBannerLandscape).height;
    } else {
        bannerView_.adSize = kGADAdSizeSmartBannerPortrait;
        yLocation = screenHeight -
        CGSizeFromGADAdSize(kGADAdSizeSmartBannerPortrait).height;
    }
    
    CGRect frame = bannerView_.frame;
    frame.origin = CGPointMake(0.0, yLocation);
    bannerView_.frame = frame;
}


@end
