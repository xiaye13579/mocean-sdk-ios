//
//  BannerAnimationViewController.h
//  AdMobileSamples
//
//  Created by Ilya Rudometov on 8/2/10.
//

#import <UIKit/UIKit.h>
#import "MASTAdView.h"

@interface BannerAnimationViewController : UIViewController <MASTAdViewDelegate>
{
	MASTAdView* _adView;
}

@end
