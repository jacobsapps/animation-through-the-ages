//
//  MyOpenGLView.m
//  ATTAOpenGL
//
//  Created by Jacob Bartlett on 02/08/2023.
//

#include <OpenGL/gl.h>
#import "MyOpenGLView.h"

@implementation MyOpenGLView

{
    float size;
    float increment;
    NSTimer *timer;
}

- (instancetype) initWithFrame : (NSRect) frame
{
    self = [super initWithFrame:frame];
    if (self) {
        size = 0.3;
        increment = 0.005;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0
                                                 target:self
                                               selector:@selector(animate)
                                               userInfo:nil
                                                repeats:YES];
    }
    return self;
}

- (void) animate {
    size += increment;
    if (size >= 0.6) {
        increment = -0.005;
    } else if (size <= 0.3) {
        increment = 0.005;
    }
    [self setNeedsDisplay:YES];
}

- (void) drawRect : (NSRect) bounds
{
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT);
    drawAnObject(size);
    glFlush();
}

static void drawAnObject(float size)
{
    glColor3f(1.0f, 0.85f, 0.35f);
    glBegin(GL_QUADS);
    {
        glVertex3f( -size,  size, 0.0);
        glVertex3f( size,   size, 0.0);
        glVertex3f( size,  -size, 0.0);
        glVertex3f( -size, -size, 0.0);
    }
    glEnd();
}

@end
