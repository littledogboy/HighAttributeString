//
//  NSObject+AGRuntime.h
//  HighAttributeString
//
//  Created by 吴书敏 on 2018/5/10.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AGRuntime)

+ (NSArray *)fetchPropertyName:(Class)class;

+ (NSArray *)fetchMethodList:(Class)class;

@end
