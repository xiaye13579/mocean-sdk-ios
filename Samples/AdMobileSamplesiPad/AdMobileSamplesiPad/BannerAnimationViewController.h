//
//  BannerAnimationViewController.h
//  AdMobileSamplesiPad
//
//  Created by Constantine Mureev on 8/10/11.
//

#import <UIKit/UIKit.h>
#import "MASTAdView.h"

@interface BannerAnimationViewController : UIViewController <MASTAdViewDelegate>
{
	MASTAdView* _adView;
}

- (id)initWithFrame:(CGRect)frame;

@end
