//
//  ViewController.m
//  ATTAOpenGL
//
//  Created by Jacob Bartlett on 08/08/2023.
//

#import "ViewController.h"
#import "ATTAOpenGLView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view = [[ATTAOpenGLView alloc] initWithFrame:NSMakeRect(0, 0, 400, 300)];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
