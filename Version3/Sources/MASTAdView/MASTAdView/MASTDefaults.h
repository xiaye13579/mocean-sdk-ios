//
//  MASTDefaults.h
//  MASTAdView
//
//  Copyright (c) 2011, 2012, 2013 Mocean Mobile. All rights reserved.
//

#ifndef MASTAdView_MASTDefaults_h
#define MASTAdView_MASTDefaults_h

// Note: __attribute__((unused)) suppresses unused warnings since the
// compiler doesn't actually find the usages elsewhere.


//
// Should only be changed by Mocean development team releasing source.
//
static NSString* MAST_DEFAULT_VERSION __attribute__((unused)) = @"3.1.2";


//
// The default ad server URL.
//
static NSString* MAST_DEFAULT_AD_SERVER_URL __attribute__((unused)) = @"http://ads.mocean.mobi/ad";


//
// Timeout for various network requests.
//
static NSTimeInterval MAST_DEFAULT_NETWORK_TIMEOUT __attribute__((unused)) = 5;


//
// How much content is allowed after parsing out click url and image
// or text content before falling through and rendering as html vs.
// native rendering.
//
static NSTimeInterval MAST_DESCRIPTOR_THIRD_PARTY_VALIDATOR_LENGTH __attribute__((unused)) = 20;


//
// Default injection HTML for rich media ads.
//
// IMPORTANT:
//  This string is a format specifier and uses %@ for parameters.
//  The first parameter represens the ad content.
//  DO NOT change the order or inclusion of these parameters.
//
static NSString* MAST_RICHMEDIA_FORMAT __attribute__((unused)) = @"<html><head><meta name=\"viewport\" content=\"user-scalable=0;\"/><style>*:not(input){-webkit-touch-callout:none;-webkit-user-select:none;-webkit-text-size-adjust:none;}body{margin:0;padding:0;}</style></head><body>%@</body></html>";


#endif
