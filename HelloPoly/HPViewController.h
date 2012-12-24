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

@interface HPViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *numberOfSidesLabel;
@property (retain, nonatomic) IBOutlet UIButton *decreaseButton;
@property (retain, nonatomic) IBOutlet UIButton *increaseButton;
@property (retain, nonatomic) IBOutlet PolygonShape *polygonShape;
@property (retain, nonatomic) IBOutlet PolygonView *polygonView;

- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;

@end
