//
//  UIGestureRecognizer+AG_TargetAction.m
//  HighAttributeString
//
//  Created by 吴书敏 on 2018/5/10.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import "UIGestureRecognizer+AG_TargetAction.h"

@implementation UIGestureRecognizer (AG_TargetAction)


- (NSString *)ag_actionName {
    NSString *actionName = nil;
    NSArray *targetArray = [self valueForKey:@"_targets"];
    for (id target in targetArray) {
        actionName = [[[[target description] componentsSeparatedByString:@","] firstObject] stringByReplacingOccurrencesOfString:@"(action=" withString:@""];
    }
    return actionName;
}

@end
