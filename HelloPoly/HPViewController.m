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
@synthesize polygonView;
@synthesize polygonName;
@synthesize sidesSlider;
@synthesize lineStyleSegmented;
@synthesize optionsView;
@synthesize mainView;
@synthesize colorPicker;
@synthesize numberOfSidesLabel;
@synthesize decreaseButton;
@synthesize increaseButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)updateInterface
{
    int numberOfSides = self.polygonShape.numberOfSides;
    
    if (numberOfSides == self.polygonShape.maximumNumberOfSides) {
        self.increaseButton.enabled = NO;
    } else {
        self.increaseButton.enabled = YES;
    }
    if (numberOfSides == self.polygonShape.minimumNumberOfSides) {
        self.decreaseButton.enabled = NO;
    } else {
        self.decreaseButton.enabled = YES;
    }
    
    self.numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", numberOfSides];
    self.sidesSlider.value = (float) numberOfSides;
    [self.lineStyleSegmented setSelectedSegmentIndex:self.polygonShape.lineStyle];
    
    self.polygonName.text = self.polygonShape.name;
    [self.polygonView setNeedsDisplay];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad called");
    
    self.polygonView.model = self.polygonShape;
    
    self.sidesSlider.minimumValue = (float)self.polygonShape.minimumNumberOfSides;
    self.sidesSlider.maximumValue = (float)self.polygonShape.maximumNumberOfSides;
    [self.colorPicker selectRow:self.polygonShape.fillColor inComponent:0 animated:NO];
    [self updateInterface];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    NSLog(@"viewDidUnload called");
    
    [self setNumberOfSidesLabel:nil];
    [self setDecreaseButton:nil];
    [self setIncreaseButton:nil];
    self.polygonView = nil;
    [self setPolygonShape:nil];
    [self setPolygonName:nil];
    [self setSidesSlider:nil];
    [self setLineStyleSegmented:nil];
    [self setOptionsView:nil];
    [self setMainView:nil];
    [self setColorPicker:nil];
    [self setColorPicker:nil];
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
    [polygonView release];
    [polygonShape release];
    [polygonName release];
    [sidesSlider release];
    [lineStyleSegmented release];
    [optionsView release];
    [mainView release];
    [colorPicker release];
    [colorPicker release];
    [super dealloc];
}

- (IBAction)decrease:(id)sender
{
    NSLog(@"I'm the decrease method");

    self.polygonShape.numberOfSides--;
    [self updateInterface];
}

- (IBAction)increase:(id)sender
{
    NSLog(@"I'm the increase method");
    
    self.polygonShape.numberOfSides++;
    [self updateInterface];
}

- (IBAction)sliderMove:(UISlider *)sender
{
    self.polygonShape.numberOfSides = (int)sender.value;
    [self updateInterface];
}

- (IBAction)changeLineStyle:(UISegmentedControl *)sender
{
    self.polygonShape.lineStyle = sender.selectedSegmentIndex;
    [self updateInterface];
}

- (IBAction)showOptions:(UISwitch *)sender
{    
    BOOL on = sender.on;
    
    [UIView beginAnimations:@"optionsAnimation" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGRect mainFrame = self.mainView.frame;
    CGRect optionsFrame = self.optionsView.frame;    
    CGFloat dy = optionsFrame.size.height;
    
    if (on) {
        mainFrame.origin.y -= dy;
        self.optionsView.hidden = NO;
    } else {
        mainFrame.origin.y += dy;
        self.optionsView.hidden = YES;
    }
    
    self.mainView.frame = mainFrame;
    
    [UIView commitAnimations];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;
    
    switch (row) {
        case 0:
            title = @"Red";
            break;
        case 1:
            title = @"Blue";
            break;
        case 2:
            title = @"Green";
            break;
        case 3:
            title = @"Yellow";
            break;
            
        default:
            title = @"None";
            break;
    }
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.polygonShape.fillColor = row;
    [self updateInterface];
}

@end
