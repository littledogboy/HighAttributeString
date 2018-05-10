//
//  BXLTextView.m
//  HighAttributeString
//
//  Created by 吴书敏 on 2018/5/9.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import "BXLTextView.h"
#import "UIGestureRecognizer+AG_TargetAction.h"
#import "UITextView+AG_Topic.h"

@implementation BXLTextView

- (void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    gestureRecognizer.enabled = NO;
    [super addGestureRecognizer:gestureRecognizer];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.editable == NO) {
        // 禁用 doubleTapInUneditable 双击手势(双击会选中文本)
        if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
            NSString *actionName = [gestureRecognizer ag_actionName];
            if ([actionName isEqualToString:@"doubleTapInUneditable:"]) {
                gestureRecognizer.enabled = NO;
                [gestureRecognizer setValue:nil forKey:@"_targets"];
            }
        }
        // 禁用压力手势(放大镜失效后会执行压力手势，所以一并禁用掉)
        if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
            if ([NSStringFromClass([gestureRecognizer class]) isEqualToString:@"_UITextSelectionForceGesture"]) {
                gestureRecognizer.enabled = NO;
                [gestureRecognizer setValue:nil forKey:@"_targets"];
            }
        }
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSArray *gestureArray = self.gestureRecognizers;
    for (UIGestureRecognizer *gesture in gestureArray) {
        // 禁用压力手势(放大镜失效后会执行压力手势，所以一并禁用掉)
        if (self.editable == NO) {
            if ([NSStringFromClass([gesture class]) isEqualToString:@"_UITextSelectionForceGesture"]) {
                gesture.enabled = NO;
                [gesture setValue:nil forKey:@"_targets"];
            }
        }
        
        // link longPress 手势
        if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]]) {
            NSString *actionName = [gesture ag_actionName];
            // 放大镜手势
            if ([actionName isEqualToString:@"loupeGesture:"]) {
                gesture.enabled = self.editable;
                if (self.editable == NO) {
                    [gesture setValue:nil forKey:@"_targets"];
                }
            }
            // 长按Link pop 手势
            if ([actionName isEqualToString:@"longDelayRecognizer:"]) {
                gesture.enabled = NO;
            }
        }
    }
}

@end
