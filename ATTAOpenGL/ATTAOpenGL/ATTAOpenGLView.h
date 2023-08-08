//
//  ATTAOpenGLView.h
//  ATTAOpenGL
//
//  Created by Jacob Bartlett on 08/08/2023.
//

#import <Cocoa/Cocoa.h>

@interface ATTAOpenGLView : NSOpenGLView {
    float rotation;
    CVDisplayLinkRef displayLink;
}
- (void) drawRect:(NSRect)dirtyRect;
@end
