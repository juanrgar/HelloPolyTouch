//
//  PolygonView.m
//  HelloPoly
//
//  Created by Juan Rafael García Blanco on 12/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

@synthesize model;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect: called");
    
    CGPoint p;
    NSArray *points = [model pointsInRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    p = [[points objectAtIndex:0] CGPointValue];
    CGContextMoveToPoint(ctx, p.x, p.y);
    
    for (NSValue *v in points) {
        p = [v CGPointValue];
        CGContextAddLineToPoint(ctx, p.x, p.y);
    }
    
    CGContextClosePath(ctx);
    
    [[UIColor redColor] setFill];
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(ctx, kCGPathFillStroke);
}


@end
