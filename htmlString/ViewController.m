//
//  ViewController.m
//  htmlString
//
//  Created by James Tang on 13/3/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {

    [self reloadData];
}

- (void)reloadData {
    NSString *htmlString = self.textView.text;
    NSAttributedString *string = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding]
                                                                  options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                            NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]}
                                                       documentAttributes:nil error:nil];

    self.previewLabel.text = nil;
    self.previewLabel.attributedText = string;

    self.previewTextView.attributedText = string;

    [self.previewLabel invalidateIntrinsicContentSize];
}

@end
