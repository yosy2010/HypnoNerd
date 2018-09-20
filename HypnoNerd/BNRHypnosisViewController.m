//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by YASSER ALTAMIMI on 20/09/2018.
//  Copyright © 2018 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisVuew.h"

@implementation BNRHypnosisViewController

// this is triggered when the window ask about the view content, so the views should be initlized here
// this is automaticually called if the view is created by nib file
// IT IS OVERRIDDEN TO CREATE A VIEW CONTROLLER PROGRAMMATICALLY
- (void)loadView
{
    // create a BNRHypnosis view instance and set it to the screen size
    BNRHypnosisVuew *backgroundView = [[BNRHypnosisVuew alloc]init];
    
    // set it as the view of this controller
    self.view = backgroundView;
    
}

// override the designated initilizer to add the photos
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // call the super initilizer
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    // does it exists?
    if (self) {
        
        // set the tab bar title
        self.tabBarItem.title = @"Hypnosis";
        
        // create a UIImage from the file to use it in the bar
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        // add it to the tab bar item image
        self.tabBarItem.image = image;
        
    }
    
    // return the initlized instance
    return self;
}

// called only the first time the view finishs loading
- (void)viewDidLoad
{
    NSLog(@"the hypnosis view controller finished loading");
}

@end
