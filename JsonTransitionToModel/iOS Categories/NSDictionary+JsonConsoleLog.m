//
//  NSDictionary+JsonConsoleLog.m
//
//  Created by songchen on 2019/4/16.
//  Copyright © 2019 songchen. All rights reserved.
//

#import "NSDictionary+JsonConsoleLog.h"

@implementation NSDictionary (JsonConsoleLog)
- (NSString *)jsonDescription {
    NSString *logString = @"";
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        logString = json;
    }
    return logString;
}

- (void)jsonStringToPasteboard {
    [UIPasteboard generalPasteboard].string = [self jsonDescription];
}

@end
