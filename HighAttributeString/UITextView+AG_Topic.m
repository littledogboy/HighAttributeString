//
//  UITextView+AG_Topic.m
//  HighAttributeString
//
//  Created by 吴书敏 on 2018/5/10.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import "UITextView+AG_Topic.h"

@implementation UITextView (AG_Topic)

- (void)registerTopicLinkSheme:(NSString *)sheme {
    NSString *regular = @"#([^#]+?)#";
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regular options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray<NSTextCheckingResult *> *array = [regularExpression matchesInString:self.text options:0 range:NSMakeRange(0, self.text.length)];
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    for (NSTextCheckingResult *result in array) {
        NSRange range = result.range;
        [mutableAttributedString addAttribute:NSLinkAttributeName value:[NSURL URLWithString:sheme] range:range];
    }
    self.attributedText = mutableAttributedString;
}

@end
