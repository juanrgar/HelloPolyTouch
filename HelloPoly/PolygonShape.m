//
//  PolygonShape.m
//  HelloPoly
//
//  Created by Juan Rafael García Blanco on 12/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides = _numberOfSides;
@synthesize minimumNumberOfSides = _minimumNumberOfSides;
@synthesize maximumNumberOfSides = _maximumNumberOfSides;

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides
{
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
    float radius = 0.9 * center.x; 
    NSMutableArray *result = [NSMutableArray array];
    float angle = (2.0 * M_PI) / numberOfSides; 
    float exteriorAngle = M_PI - angle; 
    float rotationDelta = angle - (0.5 * exteriorAngle);
    
    for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
        float newAngle = (angle * currentAngle) - rotationDelta; 
        float curX = cos(newAngle) * radius; 
        float curY = sin(newAngle) * radius;
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
    } 
    
    return result;
}

- (void)setNumberOfSides:(int)numberOfSides
{
    if (numberOfSides < self.minimumNumberOfSides) {
        _numberOfSides = self.minimumNumberOfSides;
    } else if (numberOfSides > self.maximumNumberOfSides) {
        _numberOfSides = self.maximumNumberOfSides;
    } else {
        _numberOfSides = numberOfSides;
    }
}

- (void)awakeFromNib
{
    NSLog(@"PolygonShape awakened");
    
    self.minimumNumberOfSides = 3;
    self.maximumNumberOfSides = 12;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.numberOfSides = [defaults integerForKey:@"numberOfSides"];
}

- (NSArray *)pointsInRect:(CGRect)rect
{
    return [PolygonShape pointsForPolygonInRect:rect numberOfSides:self.numberOfSides];
}

- (void)saveState
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.numberOfSides forKey:@"numberOfSides"];
}

-(NSString *)name {
	NSString *str = nil;
    NSString *ret = nil;
    
    switch (self.numberOfSides) {
        case 3:
            str = @"Triangle";
            break;
        case 4:
            str = @"Square";
            break;
		case 5:
			str = @"Pentagon";
			break;
		case 6:
			str = @"Hexagon";
			break;
		case 7:
			str = @"Heptagon";
			break;
		case 8:
			str = @"Octagon";
			break;
		case 9:
			str = @"Enneagon";
			break;
		case 10:
			str = @"Decagon";
			break;
		case 11:
			str = @"Hendecagon";
			break;
		case 12:
			str = @"Dodecagon";
			break;
        default:
            break;
    }
	ret = [[[NSString alloc] initWithString:str] autorelease];
	return ret;
}

@end
