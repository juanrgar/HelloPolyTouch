//
//  PolygonShape.h
//  HelloPoly
//
//  Created by Juan Rafael García Blanco on 12/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject

enum LineStyle {
    Solid = 0, Dashed
};

enum FillColor {
    Red = 0, Blue, Green, Yellow
};

@property (nonatomic) int numberOfSides;
@property (nonatomic) int minimumNumberOfSides;
@property (nonatomic) int maximumNumberOfSides;
@property (readonly, nonatomic) NSString *name;
@property (nonatomic) enum LineStyle lineStyle;
@property (nonatomic) enum FillColor fillColor;

- (NSArray *)pointsInRect:(CGRect)rect;
- (void)saveState;

@end
