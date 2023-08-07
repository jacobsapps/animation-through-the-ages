//
//  ATTAQuartzView.m
//  ATTAQuartz
//
//  Created by Jacob Bartlett on 06/08/2023.
//

#import "ATTAQuartzView.h"

@implementation ATTAQuartzView
{
    NSTimer *_timer;
    CGFloat _increment;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        _side = 50.0;
        _increment = 3.0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)tick:(NSTimer *)timer {
    self.side += _increment;
    if (self.side > 200.0 || self.side < 10.0) {
        _increment *= -1.0;
    }
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetRGBFillColor(context, 1.0, 0.85, 0.35, 1.0);
    CGContextFillRect(context, CGRectMake(250 - self.side / 2.0,
                                          200 - self.side / 2.0,
                                          self.side,
                                          self.side)
                      );
}

@end
