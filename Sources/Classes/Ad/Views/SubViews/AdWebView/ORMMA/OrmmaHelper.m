//
//  OrmmaHelper.m
//  AdMobileSDK
//
//  Created by Constantine Mureev on 8/29/11.
//

#import "OrmmaHelper.h"

@implementation OrmmaHelper


+ (NSString*)registerOrmmaUpCaseObject {
    return @"window.Ormma=window.ormma;";
}

+ (NSString*)signalReadyInWebView {
    return @"window.ormma.signalReady();";
}

+ (NSString*)setState:(ORMMAState)state {
    if (state == ORMMAStateDefault) {
        return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{state: 'default'}", state]];
    } else if (state == ORMMAStateExpanded) {
        return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{state: 'expanded'}", state]];
    } else if (state == ORMMAStateHidden) {
        return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{state: 'hidden'}", state]];
    } else if (state == ORMMAStateResized) {
        return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{state: 'resized'}", state]];
    } else {
        return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{state: 'default'}", state]];
    }
}

+ (NSString*)setNetwork:(NetworkStatus)status {
    NSString* network = nil;
    switch (status) {
		case ReachableViaWWAN:
			network = @"cell";
            break;
		case ReachableViaWiFi:
			network = @"wifi";
            break;
        default:
			network = @"offline";
            break;
	}
    if (network) {
        return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{network: '%@'}", network]];
    } else {
        return @"";
    }
}

+ (NSString*)setSize:(CGSize)size {
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{size: { width: %f, height: %f }}", size.width, size.height]];
}

+ (NSString*)setMaxSize:(CGSize)size {
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{maxSize: { width: %f, height: %f }}", size.width, size.height]];
}

+ (NSString*)setScreenSize:(CGSize)size {
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{screenSize: { width: %f, height: %f }}", size.width, size.height]];
}

+ (NSString*)setDefaultPosition:(CGRect)frame {
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{defaultPosition: { x: %f, y: %f, width: %f, height: %f }}", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height]];
}

+ (NSString*)setOrientation:(UIDeviceOrientation)orientation {
    NSInteger orientationAngle = -1;
	switch (orientation) {
		case UIDeviceOrientationPortrait:
			orientationAngle = 0;
			break;
		case UIDeviceOrientationPortraitUpsideDown:
			orientationAngle = 180;
			break;
		case UIDeviceOrientationLandscapeLeft:
			orientationAngle = 270;
			break;
		case UIDeviceOrientationLandscapeRight:
			orientationAngle = 90;
			break;
		default:
			orientationAngle = -1;
			break;
	}
    
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{orientation: %i}", orientationAngle]];
}

+ (NSString*)setSupports:(NSArray*)supports {
    NSString* value = [supports componentsJoinedByString:@", "];
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{supports: [%@]}", value]];
}

+ (NSString*)setKeyboardShow:(BOOL)isShow {
    if (isShow) {
        return [OrmmaHelper fireChangeEvent:@"{keyboardState: true}"];
    } else {
        return [OrmmaHelper fireChangeEvent:@"{keyboardState: false}"];
    }
}

+ (NSString*)setTilt:(UIAcceleration*)acceleration {
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{tilt: { x: %f, y: %f, z: %f }}", acceleration.x, acceleration.y, acceleration.z]];
}

+ (NSString*)setHeading:(CGFloat)heading {
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{heading: %f }", heading]];
}

+ (NSString*)setLatitude:(CGFloat)latitude longitude:(CGFloat)longitude accuracy:(CGFloat)accuracy {
    return [OrmmaHelper fireChangeEvent:[NSString stringWithFormat:@"{location: { lat: %f, lon: %f, acc: %f }}", latitude, longitude, accuracy]];
}



+ (NSString*)fireChangeEvent:(NSString*)value {
    return [NSString stringWithFormat:@"window.ormmaview.fireChangeEvent(%@);", value];
}

+ (NSString*)fireShakeEventInWebView {
    return @"window.ormmaview.fireShakeEvent();";
}

+ (CGSize)screenSizeForOrientation:(UIDeviceOrientation)orientation {
	CGSize size;
	UIScreen *screen = [UIScreen mainScreen];
	CGSize screenSize = screen.bounds.size;	
	if (UIDeviceOrientationIsLandscape(orientation)) {
		// Landscape Orientation, reverse size values
		size.width = screenSize.height;
		size.height = screenSize.width;
	} else {
		// portrait orientation, use normal size values
		size.width = screenSize.width;
		size.height = screenSize.height;
	}
	return size;
}

@end
