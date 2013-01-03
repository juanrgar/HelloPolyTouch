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
    CGMutablePathRef path = CGPathCreateMutable();
    
    UIColor *startColor = [fillColors objectAtIndex:self.model.fillColor];
    UIColor *endColor = [UIColor whiteColor];
    NSArray *gradColors = [NSArray arrayWithObjects:(id)startColor.CGColor, (id)endColor.CGColor, nil];
    NSArray *glossColors = [NSArray arrayWithObjects:(id)[UIColor colorWithWhite:1.0 alpha:0.65].CGColor,
                            [UIColor colorWithWhite:1.0 alpha:0.1].CGColor, nil];
    const CGFloat gradLoc[2] = {0.0f, 1.0f};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, 
                                                        (CFArrayRef)gradColors, gradLoc);
    CGPoint gradStart = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint gradEnd = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    CGGradientRef gloss = CGGradientCreateWithColors(colorSpace,
                                                     (CFArrayRef)glossColors, 
                                                     gradLoc);
    rect.size.height /= 2.0f;
    CGPoint glossStart = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint glossEnd = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    p = [[points objectAtIndex:0] CGPointValue];
    CGPathMoveToPoint(path, NULL, p.x, p.y);
    
    for (NSValue *v in points) {
        p = [v CGPointValue];
        CGPathAddLineToPoint(path, NULL, p.x, p.y);
    }
    CGPathCloseSubpath(path);
    
    if (self.model.lineStyle == Dashed) {
        CGFloat lengths[2] = {10.0f, 10.0f};
        CGContextSetLineDash(ctx, 0.0f, lengths, 2);
    }

    CGContextSaveGState(ctx);
    CGContextAddPath(ctx, path);
    CGContextClip(ctx);
    CGContextDrawLinearGradient(ctx, gradient, gradStart, gradEnd, 0);
    CGContextRestoreGState(ctx);

    CGContextSaveGState(ctx);
    CGContextAddPath(ctx, path);
    CGContextClip(ctx);
    CGContextDrawLinearGradient(ctx, gloss, glossStart, glossEnd, 0);
    CGContextRestoreGState(ctx);
    
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    CGGradientRelease(gloss);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
