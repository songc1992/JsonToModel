# JsonToModel
基于YYModel,利用mac程序将json字符串转化成OC的Model类 省去json转模型部分代码.

# 使用步骤
- 将项目拉到本地
- 将 [iOS Categories](https://github.com/songc1992/JsonToModel/tree/master/JsonTransitionToModel/iOS%20Categories) 文件夹下的 `Category` 拖到 iOS 项目中。
- 在 `iOS` 项目添加并第一次请求新接口时，在返回请求结果的方法中，让需要转成 `Model` 的 `ResponseObject` 调用 `- (void)jsonStringToPasteboard;` 方法，调用这个方法，会自动将格式化的 JSON 字符串复制到系统粘贴板。
- 打开并运行此 JsonToModel 项目。
- 项目运行的 macOS 应用窗口打开以后，将系统粘贴板内容 Command + V 到左下角的输入框中，并根据需要填写 `Class Name`、`ProjectName`、`Author Name`，点击 `Generate Class File`，文件生成成功会弹框提示，点击 OK 自动打开生成路径。
- 把生成的 Model 文件拖到 iOS 项目中

# 注意事项