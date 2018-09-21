//
//  QuizViewController.m
//  Quiz
//
//  Created by YASSER ALTAMIMI on 15/09/2018.
//  Copyright © 2018 YASSER ALTAMIMI. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex; // to keep track of the order of the question

// properties for models
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

// properties for views
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLAbel;

@end

@implementation QuizViewController

// methods for the buttons (actions)
// when show questoin is clicked
- (IBAction)showQuestion:(id)sender
{
    
    // increase the index
    self.currentQuestionIndex++;
    
    // am i past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        
        //go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // get the index
    int currentIndex = [self currentQuestionIndex];
    
    // get the string at the index to get the right question
    NSString *question = self.questions[currentIndex];
    
    // display it
    self.questionLabel.text = question;
    
    // reset the answer label
    self.answerLAbel.text = @"???";
    
}

- (IBAction)showAnswer:(id)sender
{
    
    // get the current index
    int currentIndex = [self currentQuestionIndex];
    
    
    // get the answer string
    NSString *answer = self.answers[currentIndex];
    
    // display the answer
    self.answerLAbel.text = answer;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // call the init method implemented by the super class
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    // if the object exists
    if (self) {
        
        // put the title to the tab bar
        self.tabBarItem.title = @"Quiz";
        
        // create two arrays filled with questions and answer and make them
        self.questions = @[@"From what is cognac made",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    // return the address of the new object
    return self;
}

@end
