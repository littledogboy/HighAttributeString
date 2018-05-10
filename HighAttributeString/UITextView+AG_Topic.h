//
//  UITextView+AG_Topic.h
//  HighAttributeString
//
//  Created by 吴书敏 on 2018/5/10.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (AG_Topic)

// 格式： xx://[xxxx]
// xx 为要跳转的类名
- (void)registerTopicLinkSheme:(NSString *)sheme;

@end
