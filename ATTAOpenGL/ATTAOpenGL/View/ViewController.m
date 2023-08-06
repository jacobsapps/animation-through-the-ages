//
//  ViewController.m
//  ATTAOpenGL
//
//  Created by Jacob Bartlett on 02/08/2023.
//

#import "ViewController.h"
#import "MyOpenGLView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view = [[MyOpenGLView alloc] init];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
