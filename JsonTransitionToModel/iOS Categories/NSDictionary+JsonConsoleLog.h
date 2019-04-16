//
//  NSDictionary+JsonConsoleLog.h
//
//  Created by songchen on 2019/4/16.
//  Copyright © 2019 songchen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 在控制台输出字典的 JSON 格式字符串
 
 需要勾选 iOS 模拟器 Edit > Automatically Sync Pasteboard选项
 这样可以使 macOS 共享 iOS 模拟器粘贴板数据
 */
@interface NSDictionary (JsonConsoleLog)

/**
 在控制台调用，输出 JSON 格式字符串

 @return JSON 格式字符串
 */
- (NSString *)jsonDescription;

/**
 把字典转换成 JSON 字符串，并自动复制到粘贴板上，每次请求新接口时调用，配合 https://github.com/songc1992/JsonToModel 自动生成 model
 */
- (void)jsonStringToPasteboard;
@end

NS_ASSUME_NONNULL_END
