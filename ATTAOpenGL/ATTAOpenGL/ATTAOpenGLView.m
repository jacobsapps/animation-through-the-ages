//
//  ATTAOpenGLView.m
//  ATTAOpenGL
//
//  Created by Jacob Bartlett on 08/08/2023.
//

#include <OpenGL/gl.h>
#import <CoreVideo/CVDisplayLink.h>
#import "ATTAOpenGLView.h"

static CVReturn ATTADisplayLinkCallback(
    CVDisplayLinkRef displayLink,
    const CVTimeStamp* now,
    const CVTimeStamp* outputTime,
    CVOptionFlags flagsIn,
    CVOptionFlags* flagsOut,
    void* displayLinkContext)
{
    @autoreleasepool {
        ATTAOpenGLView* view = (__bridge ATTAOpenGLView*)displayLinkContext;
        
        [view performSelectorOnMainThread:@selector(markForRedisplay) withObject:nil waitUntilDone:NO];
        
        return kCVReturnSuccess;
    }
}

@implementation ATTAOpenGLView

- (void)markForRedisplay {
    [self setNeedsDisplay:YES];
}

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    
    GLint swapInterval = 1;
    [[self openGLContext] setValues:&swapInterval forParameter:NSOpenGLCPSwapInterval];

    rotation = 0.0f;
    
    CVDisplayLinkCreateWithActiveCGDisplays(&displayLink);
    CVDisplayLinkSetOutputCallback(displayLink, &ATTADisplayLinkCallback, (__bridge void*)self);
    CVDisplayLinkStart(displayLink);
    
    return self;
}

- (void) drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    rotation += 1.0f;
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT);
    drawAnObject(rotation);
    glFlush();
}

static void drawAnObject(float rotation)
{
    glPushMatrix();
    glRotatef(rotation, 0.33333333333f, 1.0f, 0.5f);
    glColor3f(0.5f, 0.8f, 0.1f);
    glBegin(GL_TRIANGLES);
    {
        glVertex3f( -0.5, -0.5, 0.0);
        glVertex3f(  0.0,  0.5, 0.0);
        glVertex3f(  0.5, -0.5, 0.0);
    }
    glEnd();
    glPopMatrix();
}

- (void) dealloc {
    CVDisplayLinkStop(displayLink);
    CVDisplayLinkRelease(displayLink);
}

@end

