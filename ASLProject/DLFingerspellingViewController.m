//
//  DLFingerspellingViewController.m
//  ASLProject
//
//  Created by DetroitLabsUser on 3/28/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "DLFingerspellingViewController.h"

@interface DLFingerspellingViewController ()
@property (nonatomic, strong) IBOutlet UIButton *generateButton;
@property (nonatomic, strong) IBOutlet UIButton *submitButton;
@property (nonatomic, strong) IBOutlet UITextField *answerTextField;
@property (nonatomic, strong) IBOutlet UIImageView *guessImage;
@property (nonatomic, strong) NSString *currentAnswer;

@end

@implementation DLFingerspellingViewController

- (IBAction)generatePress:(id)sender {
    int randomIndex = arc4random() % [_answerArray count];
    
    self.currentAnswer = self.answerArray[randomIndex];
    
    NSString *imageName = [NSString stringWithFormat:@"%@.jpg", self.currentAnswer];
    
    [self.guessImage setImage:[UIImage imageNamed:imageName]];
    self.guessImage.layer.borderWidth = 0;
    self.answerTextField.text = nil;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.answerArray = [NSArray arrayWithObjects:
                       @"a",
                       @"b",
                       @"c",
                       @"d",
                       @"e",
                       @"f",
                       @"g",
                       @"h",
                       @"i",
                       @"j",
                       @"k",
                       @"l",
                       @"m",
                       @"n",
                       @"o",
                       @"p",
                       @"q",
                       @"r",
                       @"s",
                       @"t",
                       @"u",
                       @"v",
                       @"w",
                       @"x",
                       @"y",
                       @"z", nil];
    
    self.title = @"Fingerspelling";
    
    [self generatePress:nil];
    
    self.answerTextField.delegate = self;
    
}
- (IBAction)submitButtonPressed:(id)sender {
    NSString *answer = self.answerTextField.text;
    
    if ([answer isEqualToString:self.currentAnswer]) {
        //self.answerTextField.textColor = [UIColor greenColor];
        self.guessImage.layer.borderColor = [[UIColor greenColor] CGColor];
        self.guessImage.layer.borderWidth = 5.0;
    } else {
        self.guessImage.layer.borderColor = [[UIColor redColor] CGColor];
        self.guessImage.layer.borderWidth = 5.0;
    }
    NSMutableArray *ma = [@[@"1", @"2"] mutableCopy];
    [ma addObject:@"3"];
    ma = nil;
    
    
    NSMutableString *lastName = [@"Doe" mutableCopy];
    [self nameWithFirstName:@"Nate" lastName:lastName middleInitial:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (NSString *)nameWithFirstName:(NSString *)firstName lastName:(NSString *)lastName middleInitial:(NSString *)middleInitial {
    return nil;
}


@end
