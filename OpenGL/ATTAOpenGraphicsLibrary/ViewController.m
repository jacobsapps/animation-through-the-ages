//
//  ViewController.m
//  ATTAOpenGraphicsLibrary
//
//  Created by Jacob Bartlett on 07/08/2023.
//

#import "ViewController.h"
#import "ATTAOpenGLView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view = [[ATTAOpenGLView alloc] init];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
