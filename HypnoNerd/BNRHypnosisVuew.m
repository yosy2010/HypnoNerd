//
//  BNRHypnosisVuew.m
//  Hypnosister
//
//  Created by YASSER ALTAMIMI on 18/09/2018.
//  Copyright © 2018 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRHypnosisVuew.h"

@interface BNRHypnosisVuew ()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation BNRHypnosisVuew

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

// override the drawRect method to draw a circle
- (void)drawRect:(CGRect)rect {
    
    // get hte currnt bounds
    CGRect bounds = self.bounds;
    
    // then get the mid point of the bounds rectangle by using CGPoint
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // the largest circle will circumscribe the view
    float maxRadius = hypotf(bounds.size.width, bounds.size.height);
    
    // UIBezierPath is used to draw lines and curves that I want
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadious = maxRadius; currentRadious > 0; currentRadious -= 20) {
        
        // move to the new point
        [path moveToPoint:CGPointMake(center.x + currentRadious, center.y)];
        
        // create a circle
        [path addArcWithCenter:center
                        radius:currentRadious
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // change line width
    path.lineWidth = 10;
    
    
    
    // giving it a color
    [self.circleColor setStroke];
    
    // until nex comment: this is the bronze challenge
    ////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////
    // bringing an image to the view
    UIImage *logo = [UIImage imageNamed:@"logo.png"];
    
    // make the size of the image half the size of the view
    CGSize size = CGSizeMake(bounds.size.width / 2,
                             bounds.size.height / 2);
    
    // points: once we get the mid point by(width/2)and(height/2) we minues half of the image size because the image start drawing at the upper right corner
    CGPoint point = CGPointMake((bounds.size.width / 2) - (size.width / 2),
                                (bounds.size.height / 2) - (size.height / 2));
    
    [logo drawInRect:CGRectMake(point.x, point.y, size.width, size.height)];
    ////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////
    // end of the challenge and can be deleted if needed later with no harm to the project
    
    // drawing it
    [path stroke];
    
}

// init with frame that used to come by default if youe supclassing UIView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // set the back ground to clear (transperent) for every view in this class
        // if we did it in the AppDelegate then we will have to do it for every circle but in
        // here we have to do it only once
        self.backgroundColor = [UIColor clearColor];
        
        // default color for the circles
        // this one fot the circle color and not for the frame
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // log that it was touched
    NSLog(@"%@ was touched", self);
    
    // get three randoum numbers between 0-1 to assigm them to th uicolor for the RGB channels
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    // assign a randoum color to a UIColor object
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1];
    
    // assign it to the circle color
    self.circleColor = randomColor;
}

// to add the view to the dirty list of the run loop and to send it the message to redraw it self to the screen, we need a custom accessor to the property that need to be changed (circleColor) in this case
- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    
    // add it to the list of dirty views
    [self setNeedsDisplay];
}

@end
