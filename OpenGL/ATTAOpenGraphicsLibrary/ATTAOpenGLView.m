//
//  ATTAOpenGLView.m
//  ATTAOpenGL
//
//  Created by Jacob Bartlett on 07/08/2023.
//

#include <OpenGL/gl.h>
#import "ATTAOpenGLView.h"

@implementation ATTAOpenGLView

- (void) drawRect : (NSRect) bounds
{
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT);
    drawAnObject();
    glFlush();
}

static void drawAnObject(void)
{
    glColor3f(0.5f, 0.8f, 0.1f);
    glBegin(GL_TRIANGLES);
    {
        glVertex3f( -0.5, -0.5, 0.0);
        glVertex3f(  0.0,  0.5, 0.0);
        glVertex3f(  0.5, -0.5, 0.0);
    }
    glEnd();
}

@end
