//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by YASSER ALTAMIMI on 20/09/2018.
//  Copyright © 2018 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisVuew.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>
@end

@implementation BNRHypnosisViewController

// this is triggered when the window ask about the view content, so the views should be initlized here
// this is automaticually called if the view is created by nib file
// IT IS OVERRIDDEN TO CREATE A VIEW CONTROLLER PROGRAMMATICALLY

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

- (void)loadView
{
    // create a BNRHypnosis view instance and set it to the screen size
    BNRHypnosisVuew *backgroundView = [[BNRHypnosisVuew alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // create a text field and set it up
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 70, 240, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    // set this object as the delegate of the text field
    textField.delegate = self;
    
    // add to the main view (background view)
    [backgroundView addSubview:textField];
    
    // set it as the view of this controller
    self.view = backgroundView;
    
}

// called only the first time the view finishs loading
- (void)viewDidLoad
{
    NSLog(@"the hypnosis view controller finished loading");
}

// called when the user hit done on the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // call the method to put 20 labels on the screen
    [self drawMessageRandomly:textField.text];
    
    // log the text field
    NSLog(@"%@",textField.text);
    
    // remove the text in the text feild for the user
    textField.text = @"";
    
    // dismiss the keyboard
    [textField resignFirstResponder];
    
    return YES;
}

// method to place 20 text labels at random places on the screen
- (void)drawMessageRandomly: (NSString *)message
{
    for (int i = 0; i < 20; i++) {
        
        // create a label to put the message in
        UILabel *label = [[UILabel alloc] init];
        
        // set the label color and text
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = message;
        
        // this method resize the label to be relative to the text inside it
        [label sizeToFit];
        
        // get random x and y values that fits inside the hypnosis view
        // we get the (width, height) of the screen - the (width, height) of the label
        int width = (int) (self.view.bounds.size.width - label.bounds.size.width);
        int height = (int) (self.view.bounds.size.height - label.bounds.size.height);
        
        int x = arc4random() % width;
        int y = arc4random() % height;
        
        // then update the label's frame
        
        // get the frame of the label
        CGRect frame = label.frame;
        
        // keep the size which we configered in the method (sizeToFit) but change the origin
        // here we changed the origin randomly and stored it in the frame we created
        frame.origin = CGPointMake(x, y);
        
        // put that frame as the label frame
        label.frame = frame;
        
        // add the label to the view
        [self.view addSubview:label];
        
        // motion effect
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [label addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [label addMotionEffect:motionEffect];
        
    }
}

@end
