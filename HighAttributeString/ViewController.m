//
//  ViewController.m
//  HighAttributeString
//
//  Created by 吴书敏 on 2018/5/8.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import "ViewController.h"
#import "TopicDetailViewController.h"
#import "Person.h"
#import "UITextView+AG_Topic.h"

@interface ViewController () <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) IBOutlet UIButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.textView.text = @"#话题1# 话题2#我是话题#";
    [self.textView registerTopicLinkSheme:@"TopicDetailVC://"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- <UITextViewDelegate>

- (void)textViewDidChange:(UITextView *)textView {
    [textView registerTopicLinkSheme:@"TopicDetailVC://"];
}

#pragma mark - buttonAction

- (IBAction)buttonAction:(id)sender {
    self.textView.editable = NO;
}

#pragma mark - <UITextViewDelegate>

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction  API_AVAILABLE(ios(10.0)){
    if ([URL.scheme isEqualToString:@"TopicDetailVC"]) {
        NSString *topicString = [textView.text  substringWithRange:characterRange];
        NSLog(@"%@", topicString);
        TopicDetailViewController *topDetailVC = [[TopicDetailViewController alloc] init];
        topDetailVC.topicTitle = topicString;
        [self.navigationController pushViewController:topDetailVC animated:YES];
    }
    return YES;
}

@end
