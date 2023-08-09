//
//  ViewController.m
//  ATTACoreAnimation
//
//  Created by Jacob Bartlett on 08/08/2023.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setWantsLayer:YES];
    
    // 3. Sphere that rotates and changes opacity
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.frame = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2, 150, 150);
    circleLayer.cornerRadius = 75;
    circleLayer.backgroundColor = [NSColor whiteColor].CGColor;
    [self.view.layer addSublayer:circleLayer];
    
    // Scale
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @1.0;
    scaleAnimation.toValue = @1.5;
    scaleAnimation.duration = 1.0;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = HUGE_VALF;
    [circleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];

    // 3D Rotation
    CABasicAnimation *circleYRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    circleYRotation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    circleYRotation.duration = 4.0;
    circleYRotation.repeatCount = HUGE_VALF;
    [circleLayer addAnimation:circleYRotation forKey:@"sphereRotationAnimation"];

    // Gradient layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = circleLayer.bounds;
    gradientLayer.colors = @[(__bridge id)[NSColor redColor].CGColor, (__bridge id)[NSColor yellowColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.cornerRadius = circleLayer.cornerRadius;
    [circleLayer addSublayer:gradientLayer];

    // Gradient color change animation
    CABasicAnimation *colorChange = [CABasicAnimation animationWithKeyPath:@"colors"];
    colorChange.toValue = @[(__bridge id)[NSColor blueColor].CGColor, (__bridge id)[NSColor greenColor].CGColor];
    colorChange.duration = 2.0;
    colorChange.autoreverses = YES;
    colorChange.repeatCount = HUGE_VALF;
    [gradientLayer addAnimation:colorChange forKey:@"colorChangeAnimation"];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
