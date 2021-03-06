//
//  MainFuncController.m
//  JsonTransitionToModel
//
//  Created by zidonj on 2018/10/22.
//  Copyright © 2018 langlib. All rights reserved.
//

#import "MainFuncController.h"
#import "GenerateFileHelper.h"
#import "NSDate+Simple.h"
#import "First.h"

@interface MainFuncController ()

{
    
    GenerateFileHelper *_modelHelper;
    NSString *_testJsonString;
}
@property (weak) IBOutlet NSTextField *ClassNameField;
@property (weak) IBOutlet NSTextField *projectName;
@property (weak) IBOutlet NSTextField *authorName;
@property (weak) IBOutlet NSTextView *jsonField;

@end

@implementation MainFuncController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    _modelHelper = [GenerateFileHelper new];
}

- (void)alert:(BOOL)jsonString {
    
    NSAlert *alert = [[NSAlert alloc] init];
    if (!jsonString) {
        
        alert.messageText = @"json验证失败！";
        alert.informativeText = @"json数据不合法";
        
    }else{
        alert.messageText = @"json验证成功！";
        alert.informativeText = @"json验证成功！";
    }
    [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
        
    }];
}

- (IBAction)verfyJson:(id)sender {
    
    [self alert:[_modelHelper verifyJson:_jsonField.string]];
}

- (IBAction)format:(id)sender {
    
    NSString *formatJson = [_modelHelper formattingJson:_jsonField.string];
    if (formatJson.length) {
        _jsonField.string = formatJson;
    }else{
        [self alert:false];
    }
}

- (IBAction)generateClassFile:(id)sender {
    
    _modelHelper.className = _ClassNameField.stringValue;
    _modelHelper.developerName = _authorName.stringValue;
    _modelHelper.projectName = _projectName.stringValue;
    BOOL generaFileSuccess = [_modelHelper createModelWithJson:_jsonField.string];
    
    NSAlert *alert = [[NSAlert alloc] init];
    if (generaFileSuccess) {
        alert.messageText = @"生成文件成功";
        alert.informativeText = @"打开文件目录";
        [alert addButtonWithTitle:@"OK"];
        [alert addButtonWithTitle:@"取消"];
    }else{
        alert.messageText = @"生成文件失败";
    }
    __weak typeof(self) weakSelf = self;
    [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == 1000) {
            [weakSelf openFolder];
        }
    }];
}

- (void)openFolder {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *dirPath = [paths.firstObject stringByAppendingPathComponent:_modelHelper.className];
    [[NSWorkspace sharedWorkspace] selectFile:nil inFileViewerRootedAtPath:dirPath];
}

@end
