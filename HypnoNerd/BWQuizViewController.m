//
//  BWQuizViewController.m
//  Quiz
//
//  Created by Alex on 3/29/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "BWQuizViewController.h"

@interface BWQuizViewController ()

@end

@implementation BWQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions=@[@"From what is cognac made?",
                             @"What is 7+7?",
                             @"What is the capital of Vermont?"];
        self.answers=@[@"Grapes",
                           @"14",
                           @"Montpelier"];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)showQuestion:(id)sender {

    //setup to the next question
    self.currentQuestionIndex++;
    
    //Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        //Go back to the first question
        self.currentQuestionIndex=0;
    }
    
    //Get the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    //Display the string in the question label
    self.questionLabel.text=question;
    
    //Display the string in the answer label
    self.answerLabel.text=@"???";
    
}

- (IBAction)showAnswer:(id)sender {
    
    //What is the answer to the current question
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //Dispay the answer label
    self.answerLabel.text=answer;
    
}



@end
