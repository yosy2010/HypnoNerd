//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by YASSER ALTAMIMI on 20/09/2018.
//  Copyright © 2018 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRReminderViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface BNRReminderViewController ()

// this property to hold the date out of the datePicker object
// IBOutlet: is a keyword that tells xcode that the connection will be made in the interface bulder
// we made t weak because:
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController



// the acton that will happen when the user touches the add reminder buttn
// BAction: is a keyword that tells xcode that the connection will be made in the interface bulder
-(IBAction)addReminder:(id)sender
{
    // we set the date to the date picked by the user
    NSDate *date = self.datePicker.date;
    
    // and loge it
    NSLog(@"setting a reminder for %@", date);
    
    // add local notification
    // create a notification object to handle all the notification related tasks
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    // ask for permetion
    [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert + UNAuthorizationOptionSound
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
                              
                              // if we take the permision
                              if (granted) {
                                  
                                  // create notification content and set it up
                                  UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
                                  content.title = [NSString localizedUserNotificationStringForKey:@"Hypnosis!"
                                                                                        arguments:nil];
                                  
                                  content.body = [NSString localizedUserNotificationStringForKey:@"It's time to hypnosise"
                                                                                       arguments:nil];
                                  
                                  content.sound = [UNNotificationSound defaultSound];
                                  
                                  // create date componenet out of the date on the date picker
                                  NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
                                  
                                  // create the trigger using the component
                                  UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:NO];
                                  
                                  // create the request object
                                  UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"Hypnosis" content:content trigger:trigger];
                                  
                                  // schedule the alarm
                                  [center addNotificationRequest:request
                                           withCompletionHandler:^(NSError * _Nullable error) {
                                               
                                               // there is an error?
                                               if (error != nil) {
                                                   // log it
                                                   NSLog(@"%@",error.localizedDescription);
                                               }
                                           }];
                              }
                              
                          }];
}



// override the designated initlizer to add the title and the image to the tab bar item
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // first, call the super initilizer
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    // was it initilized properly?
    if (self) {
        
        // set the title
        self.tabBarItem.title = @"Reminder";
        
        // get the image
        UIImage *image = [UIImage imageNamed:@"Time"];
        
        //set the image
        self.tabBarItem.image = image;
        
    }
    
    // return the properly initilized instance of the view controller
    return self;
}

// called only the first time the view finishs loading
- (void)viewDidLoad
{
    NSLog(@"reminder View controller finished loading");
}

// called every time the view appear to the screen
- (void)viewWillAppear:(BOOL)animated
{
    // call the super view
    [super viewWillAppear:animated];
    
    // log that the view will appear
    
    NSLog(@"the reminder view controller will appear now");
    // make the minimum time to be picked one time from the time now
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
