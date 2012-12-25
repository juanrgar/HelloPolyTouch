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
    
    NSArray *fillColors = [NSArray arrayWithObjects:[UIColor redColor],
                           [UIColor blueColor],
                           [UIColor greenColor],
                           [UIColor yellowColor], nil];
    
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
    
    if (self.model.lineStyle == Dashed) {
        CGFloat lengths[2] = {10.0f, 10.0f};
        CGContextSetLineDash(ctx, 0.0f, lengths, 2);
    }
    
    [[fillColors objectAtIndex:self.model.fillColor] setFill];
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end
