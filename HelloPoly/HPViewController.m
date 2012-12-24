//
//  HPViewController.m
//  HelloPoly
//
//  Created by Juan Rafael García Blanco on 12/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HPViewController.h"

@implementation HPViewController
@synthesize polygonShape;
@synthesize numberOfSidesLabel;
@synthesize decreaseButton;
@synthesize increaseButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setNumberOfSidesLabel:nil];
    [self setDecreaseButton:nil];
    [self setIncreaseButton:nil];
    [self setPolygonShape:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc
{
    [numberOfSidesLabel release];
    [decreaseButton release];
    [increaseButton release];
    [polygonShape release];
    [super dealloc];
}
- (IBAction)decrease:(id)sender
{
    NSLog(@"I'm the decrease method");
}

- (IBAction)increase:(id)sender
{
    NSLog(@"I'm the increase method");
}

@end
