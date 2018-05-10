//
//  NSObject+AGRuntime.m
//  HighAttributeString
//
//  Created by 吴书敏 on 2018/5/10.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import "NSObject+AGRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (AGRuntime)

+ (NSArray *)fetchPropertyName:(Class)class {
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList(class, &propertyCount);
    NSMutableArray *propertyNameArray = [NSMutableArray array];
    for (unsigned int i = 0; i < propertyCount; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        [propertyNameArray addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertyList);
    return propertyNameArray;
}

+ (NSArray *)fetchMethodList:(Class)class {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(class, &count);
    
    NSMutableArray *methodNameArray = [NSMutableArray array];
    for (unsigned int i = 0; i < count; i++) {
        SEL methodName = method_getName(methodList[i]);
        [methodNameArray addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return methodNameArray;
}

@end
