//
//  ViewController.m
//  ATTAQuartz
//
//  Created by Jacob Bartlett on 06/08/2023.
//

#import "ViewController.h"
#import "ATTAQuartzView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ATTAQuartzView *quartzView = [[ATTAQuartzView alloc] initWithFrame:NSMakeRect(0, 0, 400, 300)];
    
    [self.view addSubview:quartzView];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
