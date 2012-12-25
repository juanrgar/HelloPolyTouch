//
//  HPViewController.h
//  HelloPoly
//
//  Created by Juan Rafael García Blanco on 12/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PolygonShape.h"
#import "PolygonView.h"

@interface HPViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (retain, nonatomic) IBOutlet UILabel *numberOfSidesLabel;
@property (retain, nonatomic) IBOutlet UIButton *decreaseButton;
@property (retain, nonatomic) IBOutlet UIButton *increaseButton;
@property (retain, nonatomic) IBOutlet PolygonShape *polygonShape;
@property (retain, nonatomic) IBOutlet PolygonView *polygonView;
@property (retain, nonatomic) IBOutlet UILabel *polygonName;
@property (retain, nonatomic) IBOutlet UISlider *sidesSlider;
@property (retain, nonatomic) IBOutlet UISegmentedControl *lineStyleSegmented;
@property (retain, nonatomic) IBOutlet UIView *optionsView;
@property (retain, nonatomic) IBOutlet UIView *mainView;
@property (retain, nonatomic) IBOutlet UIPickerView *colorPicker;

- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (IBAction)sliderMove:(UISlider *)sender;
- (IBAction)changeLineStyle:(UISegmentedControl *)sender;
- (IBAction)showOptions:(UISwitch *)sender;

@end
