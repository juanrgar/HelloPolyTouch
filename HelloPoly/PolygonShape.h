//
//  PolygonShape.h
//  HelloPoly
//
//  Created by Juan Rafael García Blanco on 12/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject

@property (nonatomic) int numberOfSides;
@property (nonatomic) int minimumNumberOfSides;
@property (nonatomic) int maximumNumberOfSides;

- (NSArray *)pointsInRect:(CGRect)rect;
- (void)saveState;

@end
