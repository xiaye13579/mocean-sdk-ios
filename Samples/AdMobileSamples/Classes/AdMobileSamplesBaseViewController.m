//
//  AdMobileSamplesBaseViewController.m
//  AdMobileSamples
//
//  Created by Slava Budnikov on 2/18/12.
//  Copyright (c) 2012 Team Force. All rights reserved.
//

#import "AdMobileSamplesBaseViewController.h"
#import "AdMobileSaplesEditSettersTableVuewController.h"

@implementation AdMobileSamplesBaseViewController

#pragma mark -
#pragma mark Public functional

-(UIColor *)getViewBackgroundColor
{
	return [UIColor groupTableViewBackgroundColor];
}

-(UIImage *)getViewBackgroundImage
{
	return nil;//[UIImage imageNamed:@"Default.png"];
}

-(NSInteger)getBannerSite
{
	return 19829;
}

-(NSInteger)getBannerZone
{
	return 88269;
}

-(CGRect)getBannerFrame
{
	return  CGRectMake(0, 0, 320, 50);
}

-(UIViewAutoresizing)getBannerAutoresizing
{
	return UIViewAutoresizingFlexibleWidth;
}

#pragma mark -
#pragma mark Application lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];

	if ([self getViewBackgroundColor])
	{
		self.view.backgroundColor = [self getViewBackgroundColor];
	}
	
    UIImageView* imageView = [[UIImageView alloc] init];//WithImage:[UIImage imageNamed:@"Default.png"]];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	[imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
	[imageView setContentMode:UIViewContentModeCenter];
	UIImage *img = [self getViewBackgroundImage];
	if ( img )
	{
		[imageView setImage:img];
		[self.view addSubview:imageView];		
	}
    [imageView release];
	
	_adView = [[MASTAdView alloc] initWithFrame:[self getBannerFrame]];
	[_adView setAutoresizingMask:[self getBannerAutoresizing]];
    _adView.site = [self getBannerSite];
    _adView.zone = [self getBannerZone];
	_adView.autoCollapse = YES;
    [self.view addSubview:_adView];
	
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	if (_buttonEdit == nil)
	{
		_buttonEdit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(buttonAction:)];
	}
	[self.navigationItem setRightBarButtonItem:_buttonEdit animated:animated];
}

-(void)buttonAction:(id)sender
{
	if (_actionSheet == nil)
	{
		_actionSheet = [[UIActionSheet alloc] initWithTitle:@"Action" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Edit params", @"Update", nil];
	}
	[_actionSheet showInView:self.view];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    //_adView.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
    [_adView update];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{	
	return YES;
}

-(void)showEditOption
{
	AdMobileSaplesEditSettersTableVuewController *viewController = [[AdMobileSaplesEditSettersTableVuewController alloc] initWithStyle:UITableViewStyleGrouped banner:_adView];
	viewController.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	viewController.tableView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	[self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark -
#pragma mark Memory management

- (void) dealloc
{
	_adView.delegate = nil;
	[_adView release];
	[_buttonEdit release];
	[_actionSheet release];
	[super dealloc];
}

#pragma mark -
#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch (buttonIndex)
	{
		case 0:
			[self showEditOption];
			break;
		case 1:
			[_adView update];
			break;

		default:
			break;
	}
}

@end